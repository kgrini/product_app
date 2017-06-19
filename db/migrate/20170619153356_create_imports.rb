class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :title
      t.string :filename
      t.string :state, default: 'new'

      t.timestamps
    end
  end
end
