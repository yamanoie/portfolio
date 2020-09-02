class Room < ApplicationRecord

	has_many :messages, dependent: :destroy
	has_many :entries, dependent: :destroy
	belongs_to :user
	belongs_to :guest, class_name: "User", foreign_key: "guest_id", optional: true

end
