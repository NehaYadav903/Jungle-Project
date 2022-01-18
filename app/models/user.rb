class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true

  before_save :clean_email

  def self.authenticate_with_credentials(email, password)
    # return nil if email == nil
    email = email.strip.downcase
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end 
  end
end
    # @user = User.find_by_email(email.downcase.strip)
    # @user && @user.authenticate(password) ? @user : nil
  

#   private

#     def clean_email
#       self.email.downcase!
#       self.email.strip!
#     end

# end

