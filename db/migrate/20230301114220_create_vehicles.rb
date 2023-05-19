class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :image
      t.string :category
      t.string :transmission
      t.string :drive
      t.string :mileage
      t.string :integer
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
