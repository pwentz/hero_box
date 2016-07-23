class Admin::PowersController < ApplicationController
  def index
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)
    if @power.save
      flash[:success] = "Power created!"
      redirect_to powers_path
    else
      #ActiveRecord Error
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def power_params
    params.require(:power).permit(:name, :cost, :image_url)
  end
end
