class Todo < ActiveRecord::Base

    # Relations
    belongs_to :user

    # Validations
    validates :user, presence: true
    validates :title, presence: true

end
