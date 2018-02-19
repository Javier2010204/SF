class AddStateToSales < ActiveRecord::Migration[5.1]
  def change
  	add_column :sales, :estado, :string, default: "inprogress"
  end
end
