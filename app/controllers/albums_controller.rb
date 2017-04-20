class AlbumsController < ApplicationController
  before_action :logged_in?

  def create
    album = Album.new(album_params)

    if album.save
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      redirect_to new_band_album_url
    end
  end

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @bands = Band.all
    render :edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    @tracks = @album.tracks
    render :show
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url(@album)
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    if album.destroy
      redirect_to bands_url
    else
      flash[:errors] = ["Cannot delete this album for whatever reason."]
      redirect_to album_url(album)
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :album_type, :band_id)
  end
end
