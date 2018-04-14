# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    # add custom create logic here
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  
end