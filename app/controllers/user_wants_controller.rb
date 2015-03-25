class UserWantsController < ApplicationController
  before_action :set_user_want, only: [:show, :edit, :update, :destroy]

  # GET /user_wants
  # GET /user_wants.json
  def index
    @user_wants = UserWant.all
  end

  # GET /user_wants/1
  # GET /user_wants/1.json
  def show
  end

  # GET /user_wants/new
  def new
    @user_want = UserWant.new
  end

  # GET /user_wants/1/edit
  def edit
  end

  # POST /user_wants
  # POST /user_wants.json
  def create
    @user_want = UserWant.new(user_want_params)

    respond_to do |format|
      if @user_want.save
        format.html { redirect_to @user_want, notice: 'User want was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_want }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_want.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_wants/1
  # PATCH/PUT /user_wants/1.json
  def update
    respond_to do |format|
      if @user_want.update(user_want_params)
        format.html { redirect_to @user_want, notice: 'User want was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_want.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_wants/1
  # DELETE /user_wants/1.json
  def destroy
    @user_want.destroy
    respond_to do |format|
      format.html { redirect_to user_wants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_want
      @user_want = UserWant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_want_params
      params.require(:user_want).permit(:UserId, :ProductId)
    end
end
