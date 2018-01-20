require './config/environment'

class ApplicationController < Sinatra::Base
  helpers ApplicationHelpers

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "password_security"
    set :show_exceptions, false unless ENV['SINATRA_ENV'] == 'development'
    set :views, Proc.new { File.join(root, "../views") }
  end
 
  get '/' do
    erb :index
  end

  get '/signup' do
    erb :'users/create_user'
  end

  get '/login' do
    erb :'users/login'
  end
end