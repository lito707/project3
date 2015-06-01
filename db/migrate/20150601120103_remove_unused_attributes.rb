class RemoveUnusedAttributes < ActiveRecord::Migration
  def change
    remove_column :data, :integer
    remove_column :locations, :last_update
    remove_column :regressions, :coeffs
    remove_column :regressions, :reg_type
    remove_column :regressions, :probability
  end
end
