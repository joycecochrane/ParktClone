class RemoveLocationString < ActiveRecord::Migration
  def change
    remove_column :locations, :string, :string
  end
end
