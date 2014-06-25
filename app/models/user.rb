class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable, :confirmable,
  #        :omniauthable
  before_validation :ensure_session_token
  
  validates :email, :encrypted_password, :fname, :lname, presence: true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  
  has_many(
    :businesses,
    class_name: "Business",
    foreign_key: :owner_id,
    inverse_of: :owner
  )
  
  def password
    @password
  end
  
  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.encrypted_password).is_password?(password)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def find_by_session_token
    
  end

  def self.generate_session_token
     SecureRandom::urlsafe_base64(16)
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end  
end
