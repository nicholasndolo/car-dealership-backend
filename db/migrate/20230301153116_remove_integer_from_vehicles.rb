class RemoveIntegerFromVehicles < ActiveRecord::Migration[7.0]
  def change
    remove_column :vehicles, :integer
  end
end
