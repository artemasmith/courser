class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :value
      t.datetime :forced_till, index: true
      t.boolean :active, default: false

      t.timestamps null: false
    end
    add_index :currencies, :name
  end
end
