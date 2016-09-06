# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'fast_seeder'

FastSeeder.seed!(Meter, :nameId, :meterHeadType, :timeLimit, :rate,
                 :payByPhoneNumber, :lat, :lon, :timeInEffect => "Meters") do
  record 1234, "Single", 1, 1.50, 1234, 10.5, 11.5, "9-5PM"
end