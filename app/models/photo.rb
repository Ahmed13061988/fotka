class Photo < ApplicationRecord
    has_one_attached :image
    has_many :comments
    has_many :users, through: :comments #=> .users
    belongs_to :user #=> .user 
    accepts_nested_attributes_for :user 
    
    
    validates :description, :user_id, presence: true 
end
