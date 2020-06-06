class User < ApplicationRecord
    has_secure_password 
    has_one_attached :image

    has_many :photos
    has_many :comments , through: :photos
    accepts_nested_attributes_for :photos 

    validates :email, presence: true, uniqueness: true 
    
end
