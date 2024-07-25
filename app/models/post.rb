class Post < ApplicationRecord
  belongs_to :user

  # Add validations
  validates :content, presence: true
  validates :user_id, presence: true
end
