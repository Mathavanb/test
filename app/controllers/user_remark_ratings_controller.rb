class UserRemarkRatingsController < ApplicationController
  before_action :set_remark
  before_action :set_user_remark_rating, only: %i[ destroy ]

  # GET /user_remark_ratings or /user_remark_ratings.json
  def index
    @user_remark_ratings = @remark.user_remark_ratings.all
  end


  # POST /user_remark_ratings or /user_remark_ratings.json
  def create
    @user_remark_rating = @remark.user_remark_ratings.new(user_remark_rating_params)
    @user_remark_rating.user_id = current_user.id
    respond_to do |format|
      if @user_remark_rating.save
        format.html { redirect_to remark_user_remark_ratings_url(@user_remark_rating.remark_id,@user_remark_rating), notice: "User remark rating was successfully created." }
        format.json { render :show, status: :created, location: @user_remark_rating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_remark_rating.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user_remark_rating.destroy

    respond_to do |format|
      format.html { redirect_to user_remark_ratings_url, notice: "User remark rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_remark
    @remark = Remark.find(params[:remark_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_user_remark_rating
      @user_remark_rating = UserRemarkRating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_remark_rating_params
      params.require(:user_remark_rating).permit(:rate, :remark_id, :user_id)
    end
end
