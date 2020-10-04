class Notification < ApplicationRecord

  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :message, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

  include Recent

  def self.destroy_read_notifications
    notifications = Notification.where(checked: true)
    notifications.delete_all
  end
end
