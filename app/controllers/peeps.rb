get '/peeps/new' do
  erb :"peeps/new"
end

post '/peeps' do
  text = params[:text]
  maker_id = params[:maker_id]

  Peep.create(:text => text, :maker_id => maker_id)
  redirect to '/'
end
