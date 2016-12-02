class User < ApplicationRecord
  has_many :cells

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    where(auth.slice(provider: auth.provider, uid: auth.uid)).first_or_create do |user| 
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email 
      user.avatar = auth.info.picture
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

end
