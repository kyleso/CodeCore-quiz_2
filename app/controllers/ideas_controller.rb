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
    @new_review = Review.new
    @reviews = @idea.reviews.order(created_at: :desc)
  end

  def index
    @ideas = Idea.all.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @idea.update idea_params
      flash[:success] = "Idea Updated Successfully!"
      redirect_to (idea_path(@idea))
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    flash[:success] = "Your Idea Has Been Deleted!"
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Access Denied: That Post Isn't Yours!" unless can? :crud, @idea
  end
end
