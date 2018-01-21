class ListingsController < ApplicationController

  get '/listings' do
    @listings = Listing.all
    erb :'listings/index'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    listing  = current_user.listings.build(params[:listing])

    if listing.save
      redirect '/listings'
    else
      redirect '/listings/new'
    end
  end

end