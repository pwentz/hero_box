class AddColumnToHero < ActiveRecord::Migration
  def change
    add_column :heros, :password_digest, :string
  end
end
