class CardsTable < ActiveRecord::Migration
 def change
    create_table :cards do |t|

      #related to users table, from user
      t.references :user
      t.references :background
      t.text :message

      t.timestamps
    end
  end
end
