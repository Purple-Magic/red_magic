# frozen_string_literal: true

class PodcastsController < ApplicationController
  before_action :set_podcast, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @podcasts = Podcast.all
  end

  def show; end

  def new
    @podcast = Podcast.new
  end

  def edit; end

  def create
    @podcast = Podcast.create!(**podcast_params)

    render :show
  end

  def update
    @podcast.update!(**podcast_params)

    render :show
  end

  def destroy
    @podcast.destroy

    redirect_to podcasts_path
  end

  private

  def set_podcast
    @podcast = Podcast.find(params[:id])
  end

  def podcast_params
    params.require(:podcast).permit(:title, :logo)
  end
end
