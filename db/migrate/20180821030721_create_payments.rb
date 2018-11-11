class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :state
      t.integer :amount
      t.string :product

      t.timestamps
    end
  end
end
