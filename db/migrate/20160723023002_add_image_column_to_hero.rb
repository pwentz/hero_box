class AddImageColumnToHero < ActiveRecord::Migration
  def change
    add_column :heros, :image_url, :string
  end
end
