get '/' do
  @peeps = Peep.all
  erb :index
end

get '/peeps/new' do
  erb :"peeps/new"
end

post '/peeps' do
  text = params[:text]
  Peep.create(:text => text)
  redirect to '/'
end
