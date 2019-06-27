class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :post_image

  validates :post_content, presence: true, length: { maximum: 255}
end
