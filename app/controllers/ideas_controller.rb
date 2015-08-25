class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    @idea = Idea.new
  end

  # def show
  #   @idea = Idea.find(params[:idea_id])
  # end

  # def new
  #   @idea = Idea.new
  # end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      redirect_to root_path, notice: "Idea was successfully created!"
    else
      flash.now[:notice] = "Idea could not be saved."
      render :new
    end
    # respond_to do |format|
    #   if @idea.save
    #     format.html { render :index, notice: 'Idea was successfully created!' }
    #     format.json { render }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @idea.errors, status: :unprocessable_entity }
    #
    #   end
    # end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
