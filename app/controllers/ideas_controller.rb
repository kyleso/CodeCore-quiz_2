class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:destroy, :edit, :update]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to idea_url(@idea)
    else
      render :new
    end
  end

  def show
  end

  def index
    @ideas = Idea.all.order(Created_at: :desc)
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to (idea_path(@idea))
    else
      rnder :edit
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Access Denied: That Post Isn't Yours!" unless can? :crud, @post
  end
end
