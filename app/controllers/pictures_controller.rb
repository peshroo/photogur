class PicturesController < ApplicationController

  def index
    year = params[:year].to_i || 2017
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    @older_than_one_month = Picture.older_than_one_month
    @pictures_created_in_year = Picture.pictures_created_in_year(year)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      #if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
  # use the same picture_params method that we used in create
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  # def picture_params
  #   { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url]}
  # end

  private
  def picture_params
    params.require(:picture).permit(:title, :artist, :url)
  end
end
