class IdeasController < ApplicationController
  respond_to :json
  before_action :set_idea, only: [:edit, :update, :destroy]

  def index
    @ideas = Idea.all
    @idea = Idea.new
    # respond_with @ideas
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "The idea was created." }   #When someone request html, redirect...
        format.json { render json: @idea }                                        #Resond to a json request, and we're responding with a json version of the idea
        format.xml  { render xml:  @idea }
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:notice] = "The idea was not created."
          render :edit
        end
        format.json { render json: { messages: @idea.errors.messages} }   #idea.errors.full_messages => “Name has already been taken”
        format.xml  { render xml:  { messages: @idea.errors.messages} }   #idea.errors.messages => “:name => [“has already been taken”]
      end
    end

    # @idea = Idea.create(title: params[:title], description: params[:description])
    # respond_with @idea, status: 201 #notice: "Idea was successfully created!"


    # @idea = Idea.new(idea_params)
    #
    # if @idea.save
    #   redirect_to root_path, notice: "Idea was successfully created!"
    # else
    #   flash.now[:notice] = "Idea could not be saved."
    #   render :new
    # end


    # respond_to do |format|
    #   if @idea.save
    #     format.html { render :index, notice: 'Idea was successfully created!' }
    #     format.json { render :index, status: ok}
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

  def destroy
    @idea.destroy
    flash.now[:success] = "Idea was successfully deleted."
    redirect_to root_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :quality)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
