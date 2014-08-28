class LoginService
    include ActiveModel::Model

    attr_accessor :email, :password

    # Validations
    validates :email, presence: true
    validates :password, presence: true


    def authenticate
        result = user && check_password

        unless result
            errors.add :base, 'The email/password combination is not ok!'
        end

        result
    end

    def user
        @user ||= User.find_by(email: email)
    end

    protected

    def check_password
        BCrypt::Password.new(user.password_digest) == password
    end

end
