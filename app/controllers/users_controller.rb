class UsersController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/users") }

  get '/signup' do
    erb :'users/new'
  end
end