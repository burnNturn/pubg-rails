# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    # add custom create logic here
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    respond_to do |format|
      if @user.update!(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :edit, status: :ok, location: @user }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :pubg_account)
  end
  
  
end
