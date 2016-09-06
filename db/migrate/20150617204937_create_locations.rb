class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :lon
      t.belongs_to :User, index: true

      t.timestamps null: false
    end
  end
end
