class RemoveRegressionsAttributes < ActiveRecord::Migration
  def change
    remove_column :regressions, :coeffs
    remove_column :regressions, :reg_type
    remove_column :regressions, :probability
  end
end
