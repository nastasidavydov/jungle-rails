class User < ActiveRecord::Base

  # gives User model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

end
