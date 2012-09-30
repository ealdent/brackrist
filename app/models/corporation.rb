class Corporation < ActiveRecord::Base
  attr_accessible :name

  has_many :pilots
end
