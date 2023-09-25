class AddMakeToMotorcycles < ActiveRecord::Migration[7.0]
  def change
    add_column :motorcycles, :make, :string
  end
end
