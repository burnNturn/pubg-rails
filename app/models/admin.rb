class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :timeoutable, :lockable, 
    :omniauthable, :omniauth_providers => [:google_oauth2, :discord] 
end