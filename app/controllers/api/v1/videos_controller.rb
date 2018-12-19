class Api::V1::VideosController < ApplicationController
  def index
    @videos = Video.all
    render json: @videos
  end

  def create
    if video_exists
      render json: @video
    else
      @video = Video.create(video_params)
      @video.get_stream_url
      @video.save
      render json: @video
    end
  end

  private
  def video_params
    params.permit(:source_url)
  end

  def find_video
    @video = Video.find(params[:id])
  end

  def video_exists
    @video = Video.find_by(source_url: params[:source_url])
  end
end
