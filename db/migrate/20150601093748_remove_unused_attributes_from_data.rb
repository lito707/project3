class RemoveUnusedAttributesFromData < ActiveRecord::Migration
  def change
  	remove_column :data, :integer
  end
end
