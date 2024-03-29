class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nickname, :provider, :url, :username, :rate, :visible, :uid
  has_one :personal_info, foreign_key: :user_id, dependent: :destroy
  has_many :quastions, foreign_key: :user_id
  has_many :thoughts, foreign_key: :user_id
  has_many :folowers, foreign_key: :user_id
  
  def self.find_for_facebook_oauth( auth, signed_in_resource= nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(username: auth.extra.raw_info.name, provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0,20])
    end
    user     
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	user.email = data["email"] if user.email.blank?
      end
    end
  end
  
   
  
  
  
end
