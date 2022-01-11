class Psychiatrist < ApplicationRecord
    validates :name, :reigion, :email, presence: true 
    validates :name, uniqueness: true 
    validate :check_email_not_being_used

    private 

    def check_email_not_being_used
        email = self.email
        user = Psychiatrist.where(email: email)
        if user[0]
            errors.add(:email, "already in use")
        end
    end
end
