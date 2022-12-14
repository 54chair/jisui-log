class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 300 }
  default_scope -> { order(created_at: :desc) }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }
  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [500, 200])
  end
  
  #いいねしていたらtrueを返す
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
