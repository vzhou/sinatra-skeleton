helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/boards' do
  erb :boards
end

get '/profile' do
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/pins/new' do
    erb :new_pin
end

post '/login' do
  username = params[:username]
  password = params[:password]
  email = params[:email]


  user = User.find_by(email: email)
  if user 
    if user.password == password
      session[:user_id] = user.id
      redirect '/'
    end
  else
    redirect '/login'
  end
end

post '/signup' do
  username = params[:username]
  password = params[:password]
  email = params[:email]

  user = User.find_by(email: email)
  if user
    redirect '/signup'
  else
    user = User.create(username: username, email: email, password: password)
    session[:user_id] = user.id
    redirect '/'
  end
end

post '/profile/edit' do
  username = params[:username]
  password = params[:password]
  email = params[:email]

  user = User.find_by(email: email)
  if user
    user = User.update(username: username, email: email, password: password)
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/profile'
  end
end

post '/pins/create' do
  pinurl = params[:pinurl]
  title = params[:title]
  description = params[:description]
  pinimg = params[:pinimg]

  pin = Pin.find_by(title: title)
  if pin
    redirect '/'
  else
    pin = Pin.create(pinurl: pinurl, title: title, description: description, pinimg: pinimg, likes: 0, user_id: session[:user_id])
    redirect '/'
  end
  

end

post '/boards/create' do
  imgurl = params[:imgurl]
  boardname = params[:boardname]

  board = Board.find_by(boardname: boardname)
  if board
    redirect '/boards'
  else
    board = Board.create(imgurl: imgurl, boardname: boardname, user_id: session[:user_id])
    redirect '/boards'
  end
  

end