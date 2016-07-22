class AddCrimeColumnToStoppedCrime < ActiveRecord::Migration
  def change
    add_column :stopped_crimes, :crime, :string
  end
end
