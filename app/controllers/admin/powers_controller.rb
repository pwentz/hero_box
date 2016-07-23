class Admin::PowersController < Admin::BaseController
  before_action :set_power, only: [:edit, :update, :destroy, :show]
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

  def show
  end

  def edit
  end

  def update
    if @power.update_attributes(power_params)
      flash[:success] = 'Power updated!'
      redirect_to power_path(@power)
    else
      #ActiveRecord Error
      render :edit
    end
  end

  def destroy
    @power.destroy
    redirect_to powers_path
  end

  private

  def set_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :cost)
  end
end
