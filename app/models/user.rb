class User < ApplicationRecord
  before_create :generate_token
  has_many :posts, dependent: :destroy

  # Add validations
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  private

  def generate_token
    self.token = SecureRandom.hex(16) if self.token.blank?
  end
end
