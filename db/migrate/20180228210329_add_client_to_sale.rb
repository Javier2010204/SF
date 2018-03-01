class AddClientToSale < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales, :client, foreign_key: true
  end
end
