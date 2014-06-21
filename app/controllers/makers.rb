get '/makers/new' do
  erb :"makers/new"
end

post '/makers' do
  email = params[:email]
  name = params[:name]
  username = params[:username]
  password = params[:password]
  password_confirmation = params[:password_confirmation]

  
  redirect to '/'
end