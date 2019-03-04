class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
