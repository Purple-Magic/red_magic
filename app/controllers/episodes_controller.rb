# frozen_string_literal: true

class EpisodesController < ApplicationController
  before_action :set_episode, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @episodes = tramway_decorate Episode.all
  end

  def show; end

  def new
    @episode = Episode.new
  end

  def edit; end

  def create
    @episode = Episode.create!(**episode_params)

    render :show
  end

  def update
    @episode.update!(**episode_params)

    render :show
  end

  def destroy
    @episode.destroy

    redirect_to episodes_path
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:title, :podcast_id)
  end
end
