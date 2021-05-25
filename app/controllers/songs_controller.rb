class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :destroy]

  # GET /songs
  def index
    @songs = Song.all

    render json: @songs
  end

  # GET /songs/1
  def show
    render json: @song
  end

  # POST /songs
  def create
    @song = Song.new(song_params)

    if @song.save
      render json: @song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
  end

  def search
    
    tracks = RSpotify::Track.search(params["search_song_title"])
    
    tracks.each do |t| 
       song = Song.create(:name => t.name, :artist => t.artists.first.name, :album => t.album.name, :url => t.external_urls["spotify"], :uid => t.id)
     end
     @songs = Song.pull_search_results(params["search_song_title"]).limit(7)

     render json: @songs
     
    

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:name, :artist, :album, :url, :uid)
    end
end
