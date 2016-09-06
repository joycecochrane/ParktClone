class CreateMeters < ActiveRecord::Migration
  def change
    create_table :meters do |t|
       t.integer :placeMarkId
       t.integer :nameId
       t.string :meterHeadType
       t.integer :timeLimit
       t.float :rate
       t.time :startTime
       t.time :endTime
       t.integer :payByPhoneNumber
       t.float :lat
       t.float :lon

       t.timestamps null: false
    end

  end
end
