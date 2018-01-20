class ListingsController < ApplicationController

  get '/listings' do
    @listings = Listing.all
    erb :'listings/index'
  end
end