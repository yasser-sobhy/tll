class Slot < ApplicationRecord
    validates_presence_of :start, :end
    validates :end, comparison: { greater_than: :start }

    validate :duration, :availability

    def availability
        unless Slot.where("start": self.start.., "end": ..self.end).empty?
            errors.add :base, :invalid, message: "this slot is not available"
        end
    end

    def duration
        duration = (self.end - self.start) / 1.minutes
        unless duration % 15 == 0
            errors.add :base, :invalid, message: "invalid slot duration"
        end
    end
end
