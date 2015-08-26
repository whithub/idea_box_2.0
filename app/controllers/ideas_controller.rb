class IdeasController < ApplicationController
  respond_to :html, :json
  before_action :set_idea, only: [:edit, :update, :destroy, :thumbs_up, :thumbs_down]

  def index
    @ideas = Idea.order("created_at DESC" && "updated_at DESC")
    @idea = Idea.new
  end

  def new
  end

  def create
    # @idea = Idea.create(title: params[:title], description: params[:description])
    @idea = Idea.new(idea_params)
    # respond_with @idea
    if @idea.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "The idea was created." }   #When someone request html, redirect...
        format.json { render json: @idea }                                        #Resond to a json request, and we're responding with a json version of the idea
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: "The idea was3e3e3e created." }
        format.json { render json: { messages: @idea.errors.messages} }   #idea.errors.full_messages => “Name has already been taken”
      end
    end

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

  def destroy
    @idea.destroy
    flash.now[:success] = "Idea was successfully deleted."
    redirect_to root_path
  end

  def thumbs_up
    @idea.upvote
    @idea.save
    respond_with @idea
  end

  def thumbs_down
    @idea.downvote
    @idea.save
    respond_with @idea
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :quality)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
