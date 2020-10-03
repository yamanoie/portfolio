class Comment < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true

  scope :recent, -> { order(created_at: 'DESC') }

end
