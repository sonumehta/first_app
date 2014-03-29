class User < ActiveRecord::Base


attr_accessor :username, :encrypted_password, :email_id, :address, :phone_no
#  attr_accessor :password
#attr_accessible :username, :password, :email_id, :address, :phone_no

def initialize(attributes = {})
    @username  = attributes[:username]
    @email_id = attributes[:email_id]
    @encrypted_passwordd = attributes[:encrypted_password]
    @address =attributes[:address]
    @phone_no= attributes[:phone_no]
    @salt =attributes[:salt]
end

  before_save :encrypt_password
  after_save :clear_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email_id, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  #Only on Create so other actions like update password attribute can be nil
  validates_length_of :encrypted_password, :in => 6..20, :on => :create

  #attr_accessible :username, :email_id, :password, :password_confirmation

def formatted_email
    "#{@username} <#{@email_id}>"
  end

  def authenticate(username_or_email_id="", login_password="")

    if  EMAIL_REGEX.match(username_or_email_id)    
      user = User.find_by_email_id(username_or_email_id)
    else
      user = User.find_by_username(username_or_email_id)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
def encrypt_password
    unless encrypted_password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(encrypted_password, salt)
    end
  end


  
  def clear_password
    self.encrypted_password = nil
  end

end
