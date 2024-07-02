class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 2..50 }

  def self.authenticate_with_credentials(email, password)
    #take care of case sensitivity and whitespacing
    email = email.downcase.strip
    #find email
    @user = User.find_by_email(email)
    #if user exists and authicates
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
