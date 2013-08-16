require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :pass_digest, :username, :session_token, :password
  validates :username, :pass_digest, presence: true
  validate :password_length
  has_many :posts,
            :foreign_key => :owner_id,
            :primary_key => :id

  has_many :circles,
    :class_name => "Circle",
    :foreign_key => :owner_id,
    :primary_key => :id

  def reset_session!
    random = SecureRandom.urlsafe_base64
    until User.find_by_session_token(random).nil?
      random = SecureRandom.urlsafe_base64
    end
    self.session_token = random
    self.save!
    random
  end

  def password=(password)
    @password = password
    self.pass_digest = BCrypt::Password.create(@password)
  end

  def password_hash
    BCrypt::Password.new(self.pass_digest)
  end

  private
  def password_length
    errors[:password] << "Password too short" if !@password.nil? &&
                        @password.length < 4
  end
end
