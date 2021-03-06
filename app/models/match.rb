class Match < ApplicationRecord
  belongs_to :user

  validates :text, presence: true
  validates :title, presence: true
  validates :occupation, inclusion: { in: [true, false] }

  include Recent

end


