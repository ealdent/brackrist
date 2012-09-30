class Alt < ActiveRecord::Base
  attr_accessible :pilot_1, :pilot_2

  belongs_to :pilot_1, :class_name => 'Pilot'
  belongs_to :pilot_2, :class_name => 'Pilot'
end
