class CreateProductCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_categories do |t|
      t.string :title,:null=>false
      t.integer :order_no,:null=>false, :default=>0
      t.integer :products_count, :null=>false, :default=>0
      t.boolean :display, :null=>false, :default=>true
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end

    create_table :product_category_contents do |t|
      t.text :content, null:false
      t.timestamps null: false
    end
  end
end
