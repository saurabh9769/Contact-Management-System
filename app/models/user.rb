class User < ActiveRecord::Base
	include Amistad::FriendModel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :contacts

  def self.all_except(user)
  	where.not(id: user)
	end
end
