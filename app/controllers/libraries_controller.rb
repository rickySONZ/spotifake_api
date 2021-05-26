class LibrariesController < ApplicationController
  before_action :set_library, only: [:show, :update, :destroy]

  # GET /libraries
  def index
    @libraries = Library.all

    render json: @libraries
  end

  # GET /libraries/1
  def show
    render json: @library.to_json(include: [:songs])
  end

  # POST /libraries
  def create
    @library = Library.new(library_params)

    if @library.save
      render json: @library, status: :created, location: @library
    else
      render json: @library.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /libraries/1
  def update
    if @library.update(song_ids: params[:song_ids])
      render json: @library.liked_songs.to_json(include: [:song])
    else
      render json: @library.errors, status: :unprocessable_entity
    end
  end

  # DELETE /libraries/1
  def destroy
    @library.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit(:belongs_to, song_ids: [])
    end
end
