class Api::UsersController < ActionController::Base
  before_action :doorkeeper_authorize!
  
  def index
    render json: { data: User.all }
  end
end
