class CreateHeroPowers < ActiveRecord::Migration
  def change
    create_table :hero_powers do |t|
      t.references :hero, index: true, foreign_key: true
      t.references :power, index: true, foreign_key: true
    end
  end
end
