class Photo < ApplicationRecord
    has_one_attached :image
    has_many :comments
    has_many :users, through: :comments 
    belongs_to :user 
    #  accepts_nested_attributes_for :comments
    
    
    validates :description, presence: true 
end
