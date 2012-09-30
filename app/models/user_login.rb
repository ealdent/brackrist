class UserLogin < ActiveRecord::Base
  attr_accessible :ip_address, :user, :url
end
