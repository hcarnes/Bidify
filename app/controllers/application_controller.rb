require './config/environment'

class ApplicationController < Sinatra::Base
  helpers ApplicationHelpers

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "password_security"
    set :show_exceptions, false unless ENV['SINATRA_ENV'] == 'development'
    set :views, 'app/views'
  end
 
  get '/' do
    erb :index
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end