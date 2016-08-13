class Api::V1::BaseController < ApplicationController
  respond_to :json, :xml
  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Please authorize yourself before using API') do |name, password|
      hero = Hero.find_by(name: name)

      return true if hero && hero.authenticate(password)
      head :unauthorize
    end
  end
end
