class CreateHero < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.string :hometown
    end
  end
end
