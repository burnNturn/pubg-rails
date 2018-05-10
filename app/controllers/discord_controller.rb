class DiscordController < ApplicationController
  
  def sign_in
    byebug
    if cookies[:_workspace_session].present?
      @user = User.where(remember_token: cookies[:_workspace_session])
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to user_discord_omniauth_authorize_url
    end
  end
end