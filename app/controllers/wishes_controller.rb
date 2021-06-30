class WishesController < ApplicationController
  before_action :set_wish, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /wishes or /wishes.json
  def index
    @wishes = Wish.all
  end

  # GET /wishes/1 or /wishes/1.json
  def show
  end

  # GET /wishes/new
  def new
    #@wish = Wish.new
    @wish = current_user.wishes.build
  end

  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes or /wishes.json
  def create
    #@wish = Wish.new(wish_params)
    @wish = current_user.wishes.build(wish_params)

    respond_to do |format|
      if @wish.save
        format.html { redirect_to @wish, notice: "You Wish is now live." }
        format.json { render :show, status: :created, location: @wish }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishes/1 or /wishes/1.json
  def update
    respond_to do |format|
      if @wish.update(wish_params)
        format.html { redirect_to @wish, notice: "Wish was successfully updated." }
        format.json { render :show, status: :ok, location: @wish }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1 or /wishes/1.json
  def destroy
    @wish.destroy
    respond_to do |format|
      format.html { redirect_to wishes_url, notice: "Wish was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @wish = current_user.wishes.find_by(id: params[:id])
    redirect_to wishes_path, notice: "Not authorized to edit this wish" if @wish.nil?
  end

  def incr_budget_achieved
    @wish = Wish.find(params[:id])
    count = params[:wish] && params[:wish][:budget_achieved].to_i
    if count.in? [-1,1]
      @wish.update_attribute(:budget_achieved, @wish.budget_achieved + count)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      @wish = Wish.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wish_params
      params.require(:wish).permit(:title, :description, :budget_achieved, :budget_plan, :nb_likes, :goal_date, :nb_contributors, :privacy, :user_id)
    end
end
