class FriendListsController < ApplicationController
  before_action :set_friend_list, only: [:show, :edit, :update, :destroy]

  def invite_friend
    friend_user_id = params[:userid]
    friend_user_id.each do |el|
       new_friend = FriendList.where(UserId:current_user.id, FriendUserId:el).take
       if new_friend == nil
        new_friend = FriendList.create(UserId:current_user.id, FriendUserId:el)
        new_friend.save
       end
    end
  end

  # GET /friend_lists
  # GET /friend_lists.json
  def index
    @friend_lists = FriendList.all
  end

  # GET /friend_lists/1
  # GET /friend_lists/1.json
  def show
  end

  # GET /friend_lists/new
  def new
    @friend_list = FriendList.new
  end

  # GET /friend_lists/1/edit
  def edit
  end

  # POST /friend_lists
  # POST /friend_lists.json
  def create
    @friend_list = FriendList.new(friend_list_params)

    respond_to do |format|
      if @friend_list.save
        format.html { redirect_to @friend_list, notice: 'Friend list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @friend_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @friend_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_lists/1
  # PATCH/PUT /friend_lists/1.json
  def update
    respond_to do |format|
      if @friend_list.update(friend_list_params)
        format.html { redirect_to @friend_list, notice: 'Friend list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @friend_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_lists/1
  # DELETE /friend_lists/1.json
  def destroy
    @friend_list.destroy
    respond_to do |format|
      format.html { redirect_to friend_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_list
      @friend_list = FriendList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_list_params
      params.require(:friend_list).permit(:UserId, :FriendUserId)
    end
end
