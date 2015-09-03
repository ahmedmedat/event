class CreateEventUsers < ActiveRecord::Migration
  def up
    create_table :event_users do |t|
      t.references :user
      t.references :ev
      t.string :summary
      t.timestamps 
    end
    add_index :event_users ,["user_id","ev_id"]
  end
  def down
  	drop_table :event_users
  end
end
