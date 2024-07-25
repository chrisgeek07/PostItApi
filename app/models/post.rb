class Post < ApplicationRecord
  belongs_to :user

  # Add validations
  validates :post, presence: true
  validates :user_id, presence: true
end
