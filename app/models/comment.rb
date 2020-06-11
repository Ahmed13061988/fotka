class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :photo

    validates :content, :photo_id, presence: true 
end
