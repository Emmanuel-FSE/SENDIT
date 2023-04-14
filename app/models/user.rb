class User < ApplicationRecord
    has_many :parcels
    has_secure_password
    validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 5 }
    validates :user_type, inclusion: { in: %w(Admin Customer) }

    attr_readonly :id, :full_name, :password_digest, :user_type
end
