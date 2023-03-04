class Food < ApplicationRecord
  belongs_to :user
  
  validates_acceptance_of :agreement, allow_nil: false, on: :create
  
  has_many_attached :images
  
end
