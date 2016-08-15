class Api::V1::Admin::PowersController < Api::V1::BaseController
  def show
    respond_with Power.find_by(id: params[:id])
  end
end
