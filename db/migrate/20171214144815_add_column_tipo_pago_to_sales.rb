class AddColumnTipoPagoToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :tipo_pago, :string
  end
end
