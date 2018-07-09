class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.authenticate(params)
    name = params[:username]
    password = params[:password]
    user = User.find_by(email: name)
    user if user && user.valid_password?(password)
  end
end
