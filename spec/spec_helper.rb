ENV["RACK_ENV"] = "test" # sets the database to be used

require './app/server' # note that this has to come after ENV is set!

RSpec.configure do |config|

end
