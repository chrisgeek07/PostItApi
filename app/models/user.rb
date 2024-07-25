class User < ApplicationRecord
  has_secure_password
  before_create :generate_token
  has_many :posts, dependent: :destroy

  # Add validations
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end

# 5ebe2749a28367284352
# curl -X POST -H "Authorization: Bearer 5ebe2749a28367284352" -H "Content-Type: application/json" -d '{"post": {"post": "This is a new post", "user_id": 6}}' http://localhost:3000/api/v1/users/6/posts

#curl -H "Authorization: Bearer 5ebe2749a28367284352" http://localhost:3000/api/v1/users/6/posts

