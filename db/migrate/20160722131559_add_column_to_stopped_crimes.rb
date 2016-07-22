class AddColumnToStoppedCrimes < ActiveRecord::Migration
  def change
    add_column :stopped_crimes, :criminal, :string
  end
end
