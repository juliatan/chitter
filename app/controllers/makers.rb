get '/makers/new' do
  erb :"makers/new"
end

post '/makers' do
  email = params[:email]
  name = params[:name]
  username = params[:username]
  password = params[:password]
  password_confirmation = params[:password_confirmation]

  maker = Maker.create(:email => email, 
              :name => name, 
              :username => username, 
              :password => password, 
              :password_confirmation => password_confirmation)
  
  session[:maker_id] = maker.id

  redirect to '/'
end