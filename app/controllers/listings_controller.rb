class ListingsController < ApplicationController

  get '/listings' do
    @listings = Listing.current
    erb :'listings/index'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    listing  = current_user.listings.build(params[:listing])

    if listing.save
      redirect "/listings/#{listing.id}"
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

  delete '/listings/:id' do
    listing = current_user.listings.find(params[:id])
    listing.destroy
    redirect '/listings'
  end

  patch '/listings/:id' do
    listing = current_user.listings.find(params[:id])
    if listing.update(params[:listing])
      redirect "/listings/#{listing.id}"
    else
      redirect "/listings/#{listing.id}/edit"
    end
  end

  post '/listings/:id/add_bid' do
    listing = Listing.find(params[:id])
    listing.bids.build(user: current_user, amount: params[:bid_amount])
   
    if listing.save
      redirect "/listings/#{listing.id}"
    else
      # TODO: add flash error message
      redirect "/listings/#{listing.id}"
    end
  end
end