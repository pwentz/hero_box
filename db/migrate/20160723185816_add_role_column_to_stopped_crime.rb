class AddRoleColumnToStoppedCrime < ActiveRecord::Migration
  def change
    add_column :stopped_crimes, :role, :integer
  end
end
