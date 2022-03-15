class User < ActiveRecord::Base

  # gives User model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, pswd)
    user = User.find_by_email(email)
    if user && user.authenticate(pswd)
      user
    else
      nil
    end
  end

end
