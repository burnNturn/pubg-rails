class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update!(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js
      else
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end
    # byebug
    # @user = User.find(params[:id])
    # @user.update(user_params)
    # render(user_path)
  end
  
  private

  def user_params
    byebug
    params.require(:user).permit(:name, :email, :pubg_account)
  end
  
end
