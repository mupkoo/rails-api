class User < ActiveRecord::Base

    # Relations
    has_many :todos, dependent: :delete_all

    # Validations
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

end
