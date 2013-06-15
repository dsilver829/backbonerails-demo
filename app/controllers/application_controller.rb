class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @user = User.first # example
    gon.rabl "app/views/users/show.json.rabl", as: 'current_user'
  end
end
