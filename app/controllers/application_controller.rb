class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_hero

  def current_hero
    if session[:hero_id]
      @current_hero ||= Hero.find(session[:hero_id])
    end
  end
end
