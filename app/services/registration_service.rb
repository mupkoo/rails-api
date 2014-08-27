class RegistrationService
    include ActiveModel::Model

    attr_accessor :email, :password, :password_confirmation

    # Validations
    validates :email, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :password, presence: true, confirmation: true, length: 6..32
    validate :ensure_email_uniqueness

    def initialize(options = {})
        super(options)
    end

    def save
        User.create({
            email: email,
            password_digest: password_digest
        })
    end

    private

    def ensure_email_uniqueness
        if User.find_by(email: email)
            errors.add :email, 'is already taken by someone else'
        end
    end

    def password_digest
        BCrypt::Password.create(password)
    end

end
