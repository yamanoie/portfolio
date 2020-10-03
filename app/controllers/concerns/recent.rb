module Recent
  extend ActiveSupport::Concern

  included do
    scope :recent, -> { order(created_at: 'DESC') }
  end
end