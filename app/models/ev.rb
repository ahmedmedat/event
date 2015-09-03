class Ev < ActiveRecord::Base
	has_many :event_users
	has_many :users , :through => :event_users

end
