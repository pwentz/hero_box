class PowersController < ApplicationController
  before_action :set_power, only: [:show, :update]
  def index
  end

  def show
  end

  def update
    current_hero.stopped_crimes.redeem_for_purchase(@power)
    redirect_to hero_stopped_crimes_path(current_hero)
  end

  private

  def set_power
    @power = Power.find(params[:id])
  end
end
