class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    if @idea.save
      redirect_to idea_url(@idea)
    else
      render :new
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
