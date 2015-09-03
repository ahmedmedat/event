class User < ActiveRecord::Base
	has_many :event_users
	has_many :evs , :through => :event_users

end
