class Psychiatrist < ApplicationRecord
    validates :name, :reigion, :user_id, presence: true 
    validates :name, :user_id, uniqueness: true 
end
