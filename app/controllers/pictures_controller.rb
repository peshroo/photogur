class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    render text: "Received POST request to '/pictures' with the data URL: #{params}"
  end

end
