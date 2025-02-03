class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :step_count, presence: true
  validates :place, presence: { if: -> { address.blank? } }
  validates :publish_status, presence: true
  validates :address, presence: { if: -> { place.blank? } }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum publish_status: { noreleased: 0, released: 1}

  scope :latest, -> { order(created_at: :desc) }


  def get_image
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize_to_limit: [width,height]).processed
end

def self.looks(search, word)
  if search == "perfect_match"
    @post = Post.where("genre LIKE? OR place LIKE? OR address LIKE? OR body LIKE?","#{word}","#{word}","#{word}","#{word}")
  elsif search == "forward_match"
    @post = Post.where("genre LIKE? OR place LIKE? OR address LIKE? OR body LIKE?","#{word}%","#{word}%","#{word}%","#{word}%")
  elsif search == "backward_match"
    @post = Post.where("genre LIKE? OR place LIKE? OR address LIKE? OR body LIKE?","%#{word}","%#{word}","%#{word}","%#{word}")
  elsif search == "partial_match"
    @post = Post.where("genre LIKE? OR place LIKE? OR address LIKE? OR body LIKE?","%#{word}%","%#{word}%","%#{word}%","%#{word}%")
  else
    @post = Post.all
  end
end

def favorited_by?(user)
  favorites.exists?(user_id: user.id)
end


end

