class User < ApplicationRecord
  has_many :articles
  before_save {self.email = email.downcase}
  validates :username, presence: true, length: {minimum: 3, maximum: 20 },
            format: { with: /\A[a-zA-Z0-9]+\z/, message: 'cannot have special characters'  },
            uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,8}\.[a-zA-Z]{2,9})\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
end
