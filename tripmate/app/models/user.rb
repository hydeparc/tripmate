class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  MIN_PASSWORD_LENGTH = 6
  validates :password, length: { minimum: MIN_PASSWORD_LENGTH }
  enum sex: { male: 0, female: 1 }
  validates :sex, presence: true
  validates :birthday, presence: true
  validates :nationality, presence: true
end
