class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer    :product_feed_id
      t.timestamp  :updated
      t.timestamp  :deleted
      t.timestamps
    end
  end
end
