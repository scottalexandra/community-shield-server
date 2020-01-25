class User < ApplicationRecord
  has_secure_password

  validates :email, :first_name, :last_name, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validate :email_has_valid_format

  def email_has_valid_format
    email_legit = email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    errors.add(:email, 'must be a valid address') unless email_legit
  end
end
