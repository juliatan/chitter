get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  username, password = params[:username], params[:password]
  maker = Maker.authenticate(username, password) # see Maker model

  if maker
    session[:maker_id] = maker.id
    redirect to '/'
  else
    flash[:errors] = "The email or password is incorrect"
    erb :"sessions/new"
  end

end