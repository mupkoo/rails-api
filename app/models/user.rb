class User < ActiveRecord::Base

    # Validations
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

end
