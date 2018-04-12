class WelcomeController < ApplicationController
  byebug
  before_action :authenticate_user!
  def home
  end
end
