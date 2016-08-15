class Api::V1::CartPowersController < Api::V1::BaseController
  skip_before_action :require_login, :authenticate
  def create
    power = Power.find_by(id: params[:power_id])
    create_cart_power(power)
    respond_with @cart.contents.last, location: power_url(power)
  end

  private

  def create_cart_power(power)
    @cart.add_power(power)
    session[:cart] = @cart.contents
  end
end
