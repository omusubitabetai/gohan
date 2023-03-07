class Food < ApplicationRecord
  belongs_to :user
  validates_acceptance_of :agreement, allow_nil: false, on: :create
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
