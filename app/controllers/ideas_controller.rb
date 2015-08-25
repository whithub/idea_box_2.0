class IdeasController < ApplicationController
  before_action :set_idea, only: [:edit, :update, :destroy]

  def index
    @ideas = Idea.all
    @idea = Idea.new
  end

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

  def edit
  end

  def update
    if @idea.update_attributes(idea_params)
      redirect_to root_path, notice: 'Idea was successfully updated.'
    else
      flash.now[:errors] = @idea.errors.full_messages.join(", ")
      render :edit
    end

    # # respond_to do |format|
    #   if @idea.update(idea_params)
    #     format.html { redirect_to root_path, notice: 'Idea was successfully updated.' }
    #     # format.json { render :show, status: :ok, location: @product }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
