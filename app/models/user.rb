class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable, :confirmable,
  #        :omniauthable
  before_validation :ensure_session_token

  has_attached_file :avatar, styles: {profile: "300x300>", thumb: "100x100>"},
             default_url: 'default_user_image.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :email, :fname, :lname, presence: true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :email,
            :format => { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates :email, :session_token, uniqueness: true
  validates_format_of :fname, with: /\A[a-zA-Z]+\Z/
  validates_format_of :lname, with: /\A[a-zA-Z]+\Z/

  has_many(
    :businesses,
    class_name: "Business",
    foreign_key: :owner_id,
    inverse_of: :owner
  )

  has_many(
    :reviews,
    dependent: :destroy,
    class_name: "Review",
    foreign_key: :author_id,
    inverse_of: :author
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

  def self.find_by_session_token(token)
    user = User.find_by(session_token: token)
    return nil if user.nil?
    user
  end

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])

    return user if user

    User.create!(provider: auth_hash[:provider],
                 uid: auth_hash[:uid],
                 email: auth_hash[:info][:email],
                 fname: auth_hash[:info][:first_name],
                 lname: auth_hash[:info][:last_name]
                )
  end

  def self.find_or_create_by_twitter_auth_hash(auth_hash)
    user = User.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])

    return user if user

    #twitter does not appear to provide email or first and last names...
    User.create!(provider: auth_hash[:provider],
                 uid: auth_hash[:uid],
                 email: "",
                 fname: auth_hash[:info][:name].split(" ")[0],
                 lname: auth_hash[:info][:name].split(" ")[-1]
                )
  end

  def self.generate_session_token
     SecureRandom::urlsafe_base64(16)
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
