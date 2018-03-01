class AddPatientToSales < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales, :patient, foreign_key: true
  end
end
