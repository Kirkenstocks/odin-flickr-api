class StaticPagesController < ApplicationController
  def index
    flickr_api_key = Figaro.env.flickr_api_key
    flickr_secret = Figaro.env.flickr_secret
    flickr = Flickr.new(flickr_api_key, flickr_secret)

    if params[:user_id] == ''
      @photos = flickr.photos.getRecent
    elsif params[:user_id]
      @photos = flickr.photos.search(user_id: params[:user_id])
    else
      @photos = flickr.photos.getRecent
    end
  end
end
