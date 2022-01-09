class User < ApplicationRecord
    validates :username, :email, :reigion, :user_type, presence: true
    validates :username, uniqueness: true
    validate :check_email, :check_email_not_being_used
    
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