class CreateStoppedCrime < ActiveRecord::Migration
  def change
    create_table :stopped_crimes do |t|
      t.string :potential_victim
      t.string :location
      t.timestamps :date_of_crime
      t.references :hero, index: true, foreign_key: true
    end
  end
end
