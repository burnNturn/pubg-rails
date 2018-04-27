class Api::BaseController < ApplicationController
    skip_before_action :authenticate_user!
    before_filter :authenticate_user_from_token!

    private
    
    def authenticate_user_from_token!
        if !request.headers["HTTP_API_KEY"]
            render nothing: true, status: :unauthorized
        else
            @user = nil
            User.find_each do |u|
                if Devise.secure_compare(u.api_token, request.headers["HTTP_API_KEY"])
                    @user = u
                end
            end
        end
    end

end