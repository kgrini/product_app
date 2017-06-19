class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :title
      t.string :filename
      t.timestamps
    end
  end
end
