class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :post_comments, dependent: :destroy


  validates :step_count, presence: true
  validates :place, presence: true



  def get_image
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize_to_limit: [width,height]).processed
end

def self.looks(search, word)
  if search == "perfect_match"
    @post = Post.where("genre LIKE? OR place LIKE?","#{word}","#{word}")
  elsif search == "forward_match"
    @post = Post.where("genre LIKE? OR place LIKE?","#{word}%","#{word}%")
  elsif search == "backward_match"
    @post = Post.where("genre LIKE? OR place LIKE?","%#{word}","%#{word}")
  elsif search == "partial_match"
    @post = Post.where("genre LIKE? OR place LIKE?","%#{word}%","%#{word}%")
  else
    @post = Post.all
  end
end

end

