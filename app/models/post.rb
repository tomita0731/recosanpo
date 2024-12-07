class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  validates :step_count, presence: true
  validates :place, presence: true



  def get_image
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize_to_limit: [width,height]).processed
end
 end

