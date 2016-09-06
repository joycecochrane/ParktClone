class CombineMeterInEffect < ActiveRecord::Migration
  def change
    remove_column :meters, :startTime, :time
    remove_column :meters, :endTime, :time
    add_column :meters, :timeInEffect, :string

  end
end
