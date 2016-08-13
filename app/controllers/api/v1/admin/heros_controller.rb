class Api::V1::Admin::HerosController < Api::V1::BaseController
  def index
    respond_with Hero.where(role: 0)
  end

  def destroy
    respond_with Hero.destroy(params[:id])
  end
end
