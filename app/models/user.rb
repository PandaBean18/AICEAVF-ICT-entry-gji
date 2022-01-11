class User < ApplicationRecord
    validates :username, :email, :reigion, presence: true
    validates :username, uniqueness: true
    validate :check_email, :check_email_not_being_used

    has_many(
        :psychiatrists_near_user, 
        class_name: "Psychiatrist",
        foreign_key: :reigion, 
        primary_key: :reigion
    )
    
    private 

    def check_email
        email_regex = URI::MailTo::EMAIL_REGEXP
        email = self.email
        if !(!!(email =~ email_regex))
            errors.add(:email, "not valid")
        end
    end

    def check_email_not_being_used
        email = self.email
        user = User.where(email: email)
        if user[0]
            errors.add(:email, "already in use")
        end
    end
end