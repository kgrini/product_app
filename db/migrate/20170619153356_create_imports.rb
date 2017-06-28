class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :title
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.string :state, default: 'new'
      t.datetime :imported_at

      t.timestamps
    end
  end
end
