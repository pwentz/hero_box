class Admin::HerosController < Admin::BaseController
  before_action :set_hero, only: [:show, :destroy, :edit, :update]
  def show
    @most_recent = @hero.stopped_crimes.last unless @hero.stopped_crimes.empty?
  end

  def index
  end

  def new
    @hero = Hero.new
  end

  def destroy
    @hero.destroy
    redirect_to admin_heros_path(current_hero)
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.password = params[:hero][:password]
    @hero.role = hero_params[:role].to_i
    if @hero.save
      flash[:success] = "Hero created!"
      redirect_to admin_heros_path
    else
      flash[:danger] = "Invalid credentials"
      render :new
    end
  end

  def edit
  end

  def update
    if @hero.update(hero_params)
      flash[:success] = "Hero updated!"
      redirect_to admin_hero_path(@hero)
    else
      #ActiveRecord warning
      render :edit
    end
  end

  private
  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :hometown, :password, :image_url, :stopped_crime_ids => [])
  end
end
