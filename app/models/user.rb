class User < ApplicationRecord
    validates :email, :first_name, presence: true
end
