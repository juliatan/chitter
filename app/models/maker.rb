require 'bcrypt'

class Maker

  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :name, Text
  property :username, Text
  property :password_digest, Text

  attr_writer :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end