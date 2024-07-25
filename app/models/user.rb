class User < ApplicationRecord
  before_create :generate_token
  has_many :posts

  private

  def generate_token
    self.token = SecureRandom.hex(16) if self.token.blank?
  end
end
