class CreateProductFeeds < ActiveRecord::Migration
  def change
    create_table :product_feeds do |t|
      t.string     :title
      t.text       :description
      t.integer    :price
      t.string     :image_url
      t.string     :source,        default: 'desktop'
      t.string     :campaign_name
      t.string     :import_id
      t.boolean    :deleted,       default: false
      t.string     :affiliate_code
      t.timestamps
    end
  end
end
