require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
  DataMapper.auto_upgrade! # none destructive
  puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do
  DataMapper.auto_migrate! # destructive
  puts "Auto-migrate complete (potential data loss)"
end