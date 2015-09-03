class EventUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :ev
end
