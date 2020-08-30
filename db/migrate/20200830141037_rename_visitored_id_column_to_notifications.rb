class RenameVisitoredIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
  	rename_column :notifications, :visitored_id, :visited_id
  end
end
