class BackgroundsTable < ActiveRecord::Migration
 def change
    create_table :backgrounds do |t|
      t.references :category
      t.timestamps
      t.string :pic_content_type
      t.string :pic_file_name
      t.string :pic_file_size
    end
  end
end
