class TracksController < ApplicationController
  before_action :logged_in?

  def create
    track = Track.new(track_params)

    if track.save
      redirect_to track_url(track)
    else
      flash[:errors] = track.errors.full_messages
      redirect_to new_band_track_url
    end
  end

  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def edit
    @track = Track.find_by(id: params[:id])
    @albums = Album.all
    render :edit
  end

  def show
    @track = Track.find_by(id: params[:id])
    @notes = @track.notes
    render :show
  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url(@track)
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    if track.destroy
      redirect_to bands_url
    else
      flash[:errors] = ["Cannot delete this track for whatever reason."]
      redirect_to track_url(track)
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :track_type, :album_id, :lyrics)
  end
end
