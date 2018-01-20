require './config/environment'
class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/application") }

  get '/' do
    erb :index
  end
end