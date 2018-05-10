class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2, :discord]
  
  def self.from_omniauth(auth)
      byebug
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.remember_token = cookies[:_workspace_session]
      byebug
      user.remember_me
    end      
  end
#   def self.from_omniauth(access_token)
#     data = access_token.info
#     user = User.where(email: data['email']).first

#     # Uncomment the section below if you want users to be created if they don't exist
#     # unless user
#     #     user = User.create(name: data['name'],
#     #        email: data['email'],
#     #        password: Devise.friendly_token[0,20]
#     #     )
#     # end
#     user
# end
  
  def set_api_token
    return if self.api_token.present?
    self.api_token = generate_api_token
    self.save
  end

  private
  
    def generate_api_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
end
