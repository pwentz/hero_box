class RemoveImageColumnFromPower < ActiveRecord::Migration
  def change
    remove_column :powers, :image_url, :string
  end
end
