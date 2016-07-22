class HerosController < ApplicationController
  def show
    @most_recent = current_hero.stopped_crimes.last
  end
end
