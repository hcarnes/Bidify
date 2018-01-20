class UsersController < ApplicationController
  set :views, Proc.new { File.join(root, "../views") }

  get '/signup' do
    erb :'users/new'
  end
end