class AddImageUrlColumnToPower < ActiveRecord::Migration
  def change
    add_column :powers, :image_url, :string
  end
end
