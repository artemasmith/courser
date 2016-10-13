class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.string :value
      t.bool :force
      t.datetime :forced_till

      t.timestamps null: false
    end
    add_index :currencies, :name
  end
end
