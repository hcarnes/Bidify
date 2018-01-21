class ListingsController < ApplicationController

  get '/listings' do
    @listings = Listing.all
    erb :'listings/index'
  end

  get '/listings/new' do
    erb :'listings/new'
  end
end