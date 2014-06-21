require 'bcrypt'

class Maker

  include DataMapper::Resource

  property :id, Serial
  property :email, Text, :unique => true, :message => "This email has already been registered"
  property :name, Text
  property :username, Text, :unique => true, :message => "This username has already been taken"
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "Sorry, your passwords do not match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end