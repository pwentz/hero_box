require 'rails_helper'

describe SessionsController, :type => :controller do
  describe "POST #create" do
    context "with valid login" do
      post :create, :hero => attributes_for(:hero)

      expect(current_path).to eq(hero_path(Hero.first))
      expect(controller).to set_flash.to("Welcome to Hero Box!")
    end
  end
end
