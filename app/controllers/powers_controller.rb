class PowersController < ApplicationController
  def index
  end

  def show
    @power = Power.find(params[:id])
  end
end
