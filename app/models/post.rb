class Post < ApplicationRecord

belongs_to :user
has_many :post_comments, dependent: :destroy

attachment :image

validates :text, presence: true, length: { maximum: 300 }
validates :title, presence: true, length: { maximum: 30 }

has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where('text LIKE ?', "%#{query}%" )
      end
      rel
    end
  end




end
