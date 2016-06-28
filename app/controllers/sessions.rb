# aka "Login"
get '/sessions/new' do
  if request.xhr?
    erb :'sessions/new', layout: false
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  #find user based on email address
  @user = User.find_by(email: params[:email])
  #validate user based on valid password
  #if it does
  #&& is checking if user is not nill !!
  if @user && @user.authenticate(params[:password])
    #set the user-id to session
    session[:id] = @user.id
    redirect '/'
  else
    @error = "Your password or email was incorrect"
    erb :'/sessions/new'
  end
end

get '/sessions/delete' do
  session[:id] = nil
  current_user = nil
  redirect '/'
end
