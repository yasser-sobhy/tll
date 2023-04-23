class SlotsController < ApplicationController

    def index
        # for simplicity, no pagination
        render json: Slot.all.order(id: :desc)
    end

    def available
        date = params[:date].presence&.to_s&.to_date || Date.today
        duration = params[:duration].presence&.to_i || 15

        return render nothing: true, status: :bad_request unless date >= Date.today
        return render nothing: true, status: :bad_request unless duration % 15 == 0

        date_start = date.beginning_of_day
        date_end = date.end_of_day

        available_slots = ActiveRecord::Base.connection.exec_query(
            "SELECT
                ts as start, ts + make_interval(mins => $1::int) as end
            FROM
                generate_series($2::timestamptz, $3::timestamptz, make_interval(mins => $1::int)) ts
                LEFT JOIN slots ON ts >= slots.start AND ts <= slots.end
            WHERE
                slots.id IS NULL
            ORDER BY ts",
            "Load available slots",
            [duration, date_start, date_end]
        )

        render json: available_slots
    end

    def create
        create_params = params.require(:slot).permit(:start, :end)
        slot = Slot.new(create_params.merge(status: "New"))

        return render json: slot.errors, status: :bad_request unless slot.valid?
            
        if slot.save
            render json: slot
        else
            render json: slot.errors, status: :bad_request
        end
    end
end
