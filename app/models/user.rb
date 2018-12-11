class User < ActiveRecord::Base
  has_secure_password
  
  has_many :reviews
  
  validates :first_name,            presence: true
  validates :last_name,             presence: true
  validates :email,                 uniqueness: true
  validates :password,              presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase) # strip to remove whitespace, and downcase to renove any uppercase letters)
    if user
      if user.authenticate(password) # if the password is authenticated (with the email found earlier) return user
        user
      else
        nil
      end
    else
      nil
    end
  end
end
