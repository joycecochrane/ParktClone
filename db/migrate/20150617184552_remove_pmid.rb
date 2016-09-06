class RemovePmid < ActiveRecord::Migration
  def change
    remove_column :meters, :placeMarkId, :integer
  end
end
