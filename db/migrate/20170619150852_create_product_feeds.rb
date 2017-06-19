class CreateProductFeeds < ActiveRecord::Migration
  def change
    create_table :product_feeds do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :source
      t.string :import_id
      t.boolean :deleted, default: false
      t.datetime :deleted_at
      t.string :affiliate_code
      t.timestamps
    end
  end
end
