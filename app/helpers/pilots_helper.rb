require 'csv'

module PilotsHelper
  def to_csv(pilots)
    CSV.generate do |csv|
      csv << ['Name', 'Blacklisting Corporation', 'Blacklisted By', 'Blacklisted On', 'Reason', 'Known Alts']
      pilots.each do |pilot|
        corp_name = pilot.corporation ? pilot.corporation.name : ''
        user_name = pilot.user ? pilot.user.login : ''
        csv << [pilot.name, corp_name, user_name, pilot.created_at.to_s(:db), pilot.reason, '']
      end
    end
  end
end
