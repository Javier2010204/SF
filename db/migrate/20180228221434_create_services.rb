class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :code
      t.string :name
      t.text :description
      t.decimal :day_price
      t.decimal :night_price

      t.timestamps
    end
  end
end
