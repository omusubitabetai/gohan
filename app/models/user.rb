class User < ApplicationRecord
  has_many :foods
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :foods, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :requests, dependent: :destroy
end
