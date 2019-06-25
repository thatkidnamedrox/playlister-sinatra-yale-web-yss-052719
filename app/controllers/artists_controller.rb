class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  # show page
  get '/artists/:slug' do

  end

end
