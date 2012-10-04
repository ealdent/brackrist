class Pilot < ActiveRecord::Base
  attr_accessible :name, :corporation, :user, :reason, :known_alts

  belongs_to :corporation
  belongs_to :user
end
