class LikedSongsController < ApplicationController
  before_action :set_liked_song, only: [:show, :update, :destroy]

  # GET /liked_songs
  def index
    @liked_songs = LikedSong.where(library_id: params[:library_id])

    render json: @liked_songs.to_json(include: [:song])
  end

  # GET /liked_songs/1
  def show
    render json: @liked_song
  end

  # POST /liked_songs
  def create
    @liked_song = LikedSong.new(liked_song_params)

    if @liked_song.save
      render json: @liked_song, status: :created, location: @liked_song
    else
      render json: @liked_song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /liked_songs/1
  def update
    if @liked_song.update(liked_song_params)
      render json: @liked_song
    else
      render json: @liked_song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /liked_songs/1
  def destroy
    @liked_song.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liked_song
      @liked_song = LikedSong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def liked_song_params
      params.fetch(:liked_song, {})
    end
end
