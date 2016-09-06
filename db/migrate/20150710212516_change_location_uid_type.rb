class ChangeLocationUidType < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.change :User_id, :string
    end
  end
end
