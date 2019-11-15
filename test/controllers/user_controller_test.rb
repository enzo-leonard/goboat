require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # test "the truth" do
  #   assert true
  # end
  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :photo, :category, :city, :long, :lat, :price, :available, :user_id)
    end
end
