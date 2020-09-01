class CreateAddActionToNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :add_action_to_notifications do |t|
      t.string :action

      t.timestamps
    end
  end
end
