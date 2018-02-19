class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :code
      t.string :name
      t.string :description
      t.decimal :night_price
      t.decimal :day_price
      t.timestamps
    end
  end
end
