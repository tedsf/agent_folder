# aka Register
get '/users/new' do
  if request.xhr?
    erb :'/users/new', layout: false
  else
    erb :'/users/new'
  end
end

post '/users' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    redirect '/'
  else
    #error handling goes here
    @errors = "Your username or email are already used."
    erb :'/users/new'
  end
end

#aka Profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
