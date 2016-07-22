class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :heros, :role, :integer
  end
end
