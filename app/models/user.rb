class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 30 }
  validates :introduction, length: { maximum: 140 }


  attachment :icon_image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recruitments, dependent: :destroy

  def active_for_authentication?
    super && (self.is_active == true)
  end #退会機能のため

  has_many :relationships,class_name: "Relationship",  foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships,class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy
  has_many :followings, through: :relationships,source: :followed
  has_many :followers, through: :passive_relationships,source: :follower

  def follow(user_id)
     unless self == user_id
       self.relationships.find_or_create_by(followed_id: user_id.to_i, follower_id: self.id)
     end
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
      followings.include?(user)
  end

end
