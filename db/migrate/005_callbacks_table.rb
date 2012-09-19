class CallbacksTable < ActiveRecord::Migration
 def change
    create_table :callbacks do |t|
      t.string :hash
      t.references :card
      t.string :to_email
      t.string :to_name
      t.datetime :viewed_ts, :null => true

      t.timestamps
    end
  end
end
