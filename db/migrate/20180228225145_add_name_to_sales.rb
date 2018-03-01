class AddNameToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :name, :string
  end
end
