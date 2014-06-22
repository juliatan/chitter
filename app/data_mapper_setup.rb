env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/peep'
require_relative 'models/maker'

DataMapper.finalize # checked for consistency
DataMapper.auto_upgrade!