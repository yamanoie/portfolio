class CreateRemoveActionFromNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :remove_action_from_notifications do |t|
      t.integer :action

      t.timestamps
    end
  end
end
