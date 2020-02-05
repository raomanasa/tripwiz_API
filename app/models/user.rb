class User < ApplicationRecord
    extend Devise::Models
    # Include default devise modules. Others available are:
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
    include DeviseTokenAuth::Concerns::User
end
