class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user,null: false
      t.date :transaction_date,null: false
      t.string :title, null:false, limit: 60
      t.integer :price,null:false, default: 0
      t.integer :discount,null:false, default: 0
      t.integer :payment,null:false, default: 0
      t.boolean :enable, null:false, default: true
      t.timestamps
    end

    create_table :order_contents do |t|
      t.references :order,:null=>false
      t.text :content,:null=>false
    end
  end
end
