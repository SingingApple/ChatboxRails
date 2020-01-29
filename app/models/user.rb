class User < ApplicationRecord
    validates :username, uniqueness: {case_sensitive: false}, presence: true, length: {minimum: 3, maximum: 15}
    has_secure_password
    has_many :messages
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { minimum:3, maximum: 150 }, uniqueness: {case_sensitive: false}, format: {with: email_regex}
    before_save {self.username = username.downcase}
    before_save {self.email = email.downcase}
end
