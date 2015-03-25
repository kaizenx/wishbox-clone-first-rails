class PreviewSignUpsController < ApplicationController
  before_action :set_preview_sign_up, only: [:show, :edit, :update, :destroy]

  # GET /preview_sign_ups
  # GET /preview_sign_ups.json
  def index
    @preview_sign_ups = PreviewSignUp.all
  end

  # GET /preview_sign_ups/1
  # GET /preview_sign_ups/1.json
  def show
  end

  # GET /preview_sign_ups/new
  def new
    @preview_sign_up = PreviewSignUp.new
  end

  # GET /preview_sign_ups/1/edit
  def edit
  end

  # POST /preview_sign_ups
  # POST /preview_sign_ups.json
  def create
    @preview_sign_up = PreviewSignUp.new(preview_sign_up_params)

    respond_to do |format|
      if @preview_sign_up.save
        format.html { redirect_to @preview_sign_up, notice: 'Preview sign up was successfully created.' }
        format.json { render action: 'show', status: :created, location: @preview_sign_up }
      else
        format.html { render action: 'new' }
        format.json { render json: @preview_sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preview_sign_ups/1
  # PATCH/PUT /preview_sign_ups/1.json
  def update
    respond_to do |format|
      if @preview_sign_up.update(preview_sign_up_params)
        format.html { redirect_to @preview_sign_up, notice: 'Preview sign up was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @preview_sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preview_sign_ups/1
  # DELETE /preview_sign_ups/1.json
  def destroy
    @preview_sign_up.destroy
    respond_to do |format|
      format.html { redirect_to preview_sign_ups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preview_sign_up
      @preview_sign_up = PreviewSignUp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preview_sign_up_params
      params.require(:preview_sign_up).permit(:EmailAddress)
    end
end
