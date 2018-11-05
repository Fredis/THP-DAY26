class User < ApplicationRecord
  before_save {email.downcase!}
  
  VALID_PRENOM_REGEX = /\A[\W]\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :prenom, presence: true, length: { maximum: 50 }, format: {with: VALID_PRENOM_REGEX}
  validates :nom, presence: true, length: { maximum: 50 }, format: {with: VALID_PRENOM_REGEX}, uniqueness: {case_sensitive: false} 
  validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: { minimum: 6}
  has_secure_password

  

end
