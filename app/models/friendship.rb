class Friendship < ActiveRecord::Base

	belongs_to :user
	has_many :contacts

end
