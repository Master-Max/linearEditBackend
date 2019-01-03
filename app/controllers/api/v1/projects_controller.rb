class Api::V1::ProjectsController < ApplicationController
  def index
    puts "The Params #{params[:user_id]}"
    # @projects = Project.all.select{|p| p.user_id === params[:user_id]}
    @projects = Project.where(user_id: params[:user_id])
    render json: @projects
  end

  def create
    @project = Project.create(project_params)
    @project.assemble_movie
    if @project.save
      render json: @project
    else
      render json: @project
    end
  end

  def show

  end

  private
  def project_params
    params.permit(:name, :user_id, :clips)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
