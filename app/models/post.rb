class Post < ApplicationRecord
  belongs_to :user

  # Active Storage
  has_one_attached :thumbnail
  has_one_attached :banner
  
  # Action Text from Rails
  has_rich_text :body      

  validates :title, length: { minimum: 5 }
  validates :body, length: { minimum: 25 }

  # for pagination
  self.per_page = 10

  # for friendly_id
  extend FriendlyId
  friendly_id :title, use: :slugged

  def optimized_image(image, x, y)
    image.variant(resize_to_fill: [x, y]).processed
  end
end