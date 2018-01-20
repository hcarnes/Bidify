class UsersController < ApplicationController

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if user.save
      sign_in(user)
      redirect "/listings"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    erb :'users/login'
  end
end