class Maker

  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :name, Text
  property :username, Text
  property :password_digest, Text

end