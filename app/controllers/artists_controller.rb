class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  # show page
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])

  end

end
