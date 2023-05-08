class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github, :google_oauth2]


         def self.from_omniauth(access_token)
          user = User.where(email: access_token.info.email).first
          unless user
            user = User.create(
              email: access_token.info.email,
              password: Devise.friendly_token[0,20]
            )
          end
          user.name = access_token.info.name
          user.image = access_token.info.image
          user.uid = access_token.uid
          user.provider = access_token.provider
          user.save
      
          user
        end       

  # In the above line of code, we have set the lock_strategy to :failed_attempts, which means that a user's account will be locked after a certain number of failed login attempts. 
  # We have also set the maximum_attempts option to 5, which means that a user's account will be locked after 5 failed login attempts. We have set the unlock_strategy to 
  # :email, which means that the user will receive an email with a link to unlock their account. Finally, we have set the unlock_in option to 1 hour, which means that the user will be able to unlock their account 1 hour after it was locked.
         
end
