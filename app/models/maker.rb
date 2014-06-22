require 'bcrypt'

class Maker

  include DataMapper::Resource

  has n, :peeps

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

  def self.authenticate(username, password)
    maker = first(:username => username)
    # the == method calculates the candidate password_digest from
    # the password given and compares it to the password_digest
    # it was initialised with.
    # So, to recap: THIS IS NOT A STRING COMPARISON
    if maker && BCrypt::Password.new(maker.password_digest) == password
      maker # return the user
    else
      nil
    end
  end

end