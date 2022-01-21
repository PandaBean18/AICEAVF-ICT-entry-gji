class Psychiatrist < ApplicationRecord
    validates :name, :reigion, :email, presence: true 
    validates :name, uniqueness: true 
    validate :check_email_not_being_used

    has_many(
        :users_near_psychiatrist, 
        class_name: "User", 
        foreign_key: :reigion,
        primary_key: :reigion
    )

    private 

    def check_email_not_being_used
        email = self.email
        user = Psychiatrist.where(email: email)
        if user[0]
            errors.add(:email, "already in use")
        end
    end
end
