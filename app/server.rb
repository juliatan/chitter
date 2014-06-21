require 'sinatra'
require 'data_mapper'
require 'sinatra/partial'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'controllers/peeps'
require_relative 'controllers/makers'

require_relative 'helpers/application'

enable :sessions
set :session_secret, 'super secret'

register Sinatra::Flash

set :partial_template_engine, :erb
