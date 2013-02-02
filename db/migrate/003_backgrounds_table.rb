class BackgroundsTable < ActiveRecord::Migration
 def change
    create_table :backgrounds do |t|

      t.string :url
      t.references :category

      t.timestamps
    end
  end
end
