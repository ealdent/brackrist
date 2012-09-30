class Pilot < ActiveRecord::Base
  attr_accessible :name, :corporation, :user, :reason

  belongs_to :corporation
  belongs_to :user

  # TODO: alt shit


  # has_many :right_alts, :class_name => 'Alt', :foreign_key => :pilot_1_id
  # has_many :left_alts,  :class_name => 'Alt', :foreign_key => :pilot_2_id

  # def alts
  #   pilot_queue = self.right_alts + self.left_alts
  #   found_alts = []

  #   while !pilot_queue.empty?

  #     old_alt_ids_size = alt_ids.size
  #     self.right_alts.each do |alt|
  #       alt_ids << alt.pilot_2_id
  #     end

  #     self.left_alts.each do |alt|
  #       alt_ids << alt.pilot_1_id
  #     end

  #     break if old_alt_ids_size == alt_ids.size
  #   end

  #   alt_ids = alt_ids.uniq.sort.reject { |i| i == self.id }

  #   if alt_ids.empty?
  #     []
  #   else
  #     Pilot.all(:conditions => ['id IN ?', alt_ids], :order => 'name ASC')
  #   end
  # end

  # def add_alt(pilot)
  #   Alt.create(:pilot_1 => self, :pilot_2 => pilot)
  # end
end
