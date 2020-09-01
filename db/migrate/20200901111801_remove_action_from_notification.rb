class RemoveActionFromNotification < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :action, :integer
  end
end
