class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
    	t.integer :visitor_id, null: false
    	t.integer :visitored_id, null: false
    	t.integer :like_id
    	t.integer :comment_id
    	t.integer :message_id
    	t.integer :action, null: false
    	t.boolean :checked, default: false, null: false


      t.timestamps
    end
  end
end
