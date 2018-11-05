class User < ApplicationRecord
  before_save {email.downcase!}
  VALID_NAME_REGEX = /\A[a-zA-Z]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :prenom, presence: true, length: { maximum: 50 }, format: {with: VALID_NAME_REGEX}
  validates :nom, presence: true, length: { maximum: 50 }, format: {with: VALID_NAME_REGEX}
  validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false} 
  validates :password, presence: true, length: { minimum: 6}
  has_secure_password



end
