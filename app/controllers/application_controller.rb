class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_hero, :current_admin?
  before_action :require_login

  def current_hero
    if session[:hero_id]
      @current_hero ||= Hero.find(session[:hero_id])
    end
  end

  def current_admin?
    current_hero && current_hero.admin?
  end

  def require_login
    render file: '/public/login_reminder' unless current_hero
  end
end
