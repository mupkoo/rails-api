class Token < ActiveRecord::Base

    # Relations
    belongs_to :user

    # Validations
    validates :token, presence: true, uniqueness: true

end
