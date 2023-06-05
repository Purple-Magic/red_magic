class PodcastsController < ApplicationController
  before_action :set_podcast, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /podcasts or /podcasts.json
  def index
    @podcasts = Podcast.all
  end

  # GET /podcasts/1 or /podcasts/1.json
  def show
  end

  # GET /podcasts/new
  def new
    @podcast = Podcast.new
  end

  # GET /podcasts/1/edit
  def edit
  end

  def create
    @podcast = Podcast.create! **podcast_params

    render :show
  end

  def update
    @podcast.update! **podcast_params

    render :show
  end

  # DELETE /podcasts/1 or /podcasts/1.json
  def destroy
    @podcast.destroy

    respond_to do |format|
      format.html { redirect_to podcasts_url, notice: "Podcast was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def podcast_params
      params.require(:podcast).permit(:title, :logo)
    end
end
