# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

initial_slots = [
    { "start": "2022-02-01T20:00:00.000Z", "end": "2022-02-01T22:30:00.000Z", "status": "New" },
    { "start": "2022-01-31T23:00:00.000Z", "end": "2022-02-01T06:00:00.000Z", "status": "New" },
    { "start": "2022-02-01T10:15:00.000Z", "end": "2022-02-01T10:45:00.000Z", "status": "Cancelled" },
    { "start": "2022-02-01T13:55:00.000Z", "end": "2022-02-01T14:30:00.000Z", "status": "Completed" },
    { "start": "2022-02-02T10:00:00.000Z", "end": "2022-02-02T20:00:00.000Z", "status": "Cancelled" },
    { "start": "2022-02-01T09:00:00.000Z", "end": "2022-02-01T10:00:00.000Z", "status": "Completed" },
    { "start": "2022-02-01T11:30:00.000Z", "end": "2022-02-01T13:00:00.000Z", "status": "Cancelled" },
    { "start": "2022-02-01T13:00:00.000Z", "end": "2022-02-01T13:10:00.000Z", "status": "Completed" }
]

Slot.insert_all initial_slots