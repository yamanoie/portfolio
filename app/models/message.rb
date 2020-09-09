class Message < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :room

  validates :message, presence: true

  def create_notification_message!(current_user, message_id, visited_id)
    notification = current_user.active_notifications.new(
      message_id: message_id,
      visited_id: visited_id,
      action: 'message'
    )
    notification.save if notification.valid?
  end
end
