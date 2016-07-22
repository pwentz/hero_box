class Admin::StoppedCrimesController < ApplicationController
  before_action :set_stopped_crime, only: [:show, :destroy]
  def new
    @stopped_crime = StoppedCrime.new
  end

  def create
    @stopped_crime = StoppedCrime.new(crime_params)
    if @stopped_crime.save
      redirect_to admin_stopped_crimes_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @stopped_crime.destroy
    redirect_to admin_stopped_crimes_path
  end

  private

  def set_stopped_crime
    @stopped_crime = StoppedCrime.find(params[:id])
  end

  def crime_params
    params.require(:stopped_crime).permit(:crime, :criminal, :location, :potential_victim, :hero_id)
  end
end
