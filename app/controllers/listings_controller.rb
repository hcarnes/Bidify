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

  get '/listings/:id' do
    @listing = Listing.find(params[:id])
    erb :'listings/show'
  end

  get '/listings/:id/edit' do
    @listing = Listing.find(params[:id])
    erb :'listings/edit'
  end

  patch '/listings/:id' do
    listing = current_user.listings.find(params[:id])
    if listing.update(params[:listing])
      redirect '/listings'
    else
      redirect "/listings/#{listing.id}/edit"
    end
  end
end