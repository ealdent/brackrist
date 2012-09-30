class User < ActiveRecord::Base
  attr_accessible :login, :password

  has_many :user_logins

  before_create :encrypt_password

  def encrypt_password
    self.salt = Digest::SHA1.hexdigest("#{Time.now.utc.to_s} Salty meaty tasty #{rand} nulli secunda #{self.password} #{rand}")
    self.password = Digest::SHA1.hexdigest("#{self.password} #{self.salt}")
  end

  def valid_password?(pw)
    Digest::SHA1.hexdigest("#{pw} #{self.salt}") == self.password
  end

  def record_login(request)
    ip_address = request.env['HTTP_X_FORWARDED_FOR'] || request.remote_ip
    url        = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"

    self.user_logins.create(:ip_address => ip_address, :url => url)
  end
end
