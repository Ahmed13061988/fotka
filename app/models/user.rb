class User < ApplicationRecord
    has_secure_password

    has_one_attached :image


    has_many :photos
    has_many :comments , through: :photos
    # has_many :commented_photos, through: :comments, source: :user 
    accepts_nested_attributes_for :photos

    validates :email, presence: true, uniqueness: true 
    
    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
    
end
