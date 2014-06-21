env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require_relative 'models/peeps'

DataMapper.finalize # checked for consistency
DataMapper.auto_upgrade! # actual creation of databases