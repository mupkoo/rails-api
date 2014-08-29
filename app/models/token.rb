class Token < ActiveRecord::Base

    # Relations
    belongs_to :user

    # Validations
    validates :token, presence: true, uniqueness: true
    validates :user, presence: true


    def self.create_for(user)
        token = generate_token
        expires_at = 7.days.from_now

        Token.create({
            user: user,
            token: token,
            expires_at: expires_at
        })
    end

    protected

    def self.generate_token
        new_token = ''

        loop do
            new_token = SecureRandom.urlsafe_base64(64)
            break unless Token.find_by(token: new_token).present?
        end

        new_token
    end

end
