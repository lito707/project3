class RemoveLocationAttributes < ActiveRecord::Migration
  def change
    remove_column :locations, :last_update
  end
end
