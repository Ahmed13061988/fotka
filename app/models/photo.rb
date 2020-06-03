class Photo < ApplicationRecord
    has_one_attached :image
    has_many :comments
    has_many :users, through: :comments #=> .users
    belongs_to :user #=> .user 
    
    
    validates :name, presence: true 
end
