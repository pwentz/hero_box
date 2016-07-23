class CreatePower < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.string :name
      t.string :cost
      t.string :image_url
    end
  end
end
