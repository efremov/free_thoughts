class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nickname, :provider, :url, :username, :rate, :visible
  has_one :personal_info, foreign_key: :user_id, dependent: :destroy
  has_many :quastions, foreign_key: :user_id
  has_many :thoughts, foreign_key: :user_id
  has_many :folowers, foreign_key: :user_id
  
end
