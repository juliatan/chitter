get '/makers/new' do
  @maker = Maker.new # now needed since new registration form takes @maker var
  erb :"makers/new"
end

post '/makers' do
  email = params[:email]
  name = params[:name]
  username = params[:username]
  password = params[:password]
  password_confirmation = params[:password_confirmation]

  @maker = Maker.new(:email => email, 
              :name => name, 
              :username => username, 
              :password => password, 
              :password_confirmation => password_confirmation)
  

  if @maker.save # i.e. passwords match and an id is created in the database
    session[:maker_id] = @maker.id
    redirect to '/'
  else
    flash.now[:errors] = @maker.errors.full_messages # full_messages returns an array of all errors as strings
    erb :"makers/new"
  end
end