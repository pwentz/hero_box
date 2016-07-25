class ChangeColumnOnPower < ActiveRecord::Migration
  def change
    change_column :powers, :cost, "integer USING CAST(cost AS integer)"
  end
end
