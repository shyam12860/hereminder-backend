class User < ActiveRecord::Base
	has_many :alarms
end
