class ContestantProjectsController < ApplicationController

  def create
    # project = Project.find(params[:project_id])
    new_contestant = ContestantProject.create(create_params)
    if Contestant.exists?(params[:contestant_id]) && new_contestant.save
      redirect_to "/projects/#{params[:project_id]}"
    else
      redirect_to "/projects/#{params[:project_id]}"
      flash[:notice] = "Invalid contestant id! Try again!"
    end
  end

  private
  def create_params
    params.permit(:contestant_id, :project_id)
  end
end
