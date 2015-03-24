class RevertToTextFieldForArrival < ActiveRecord::Migration
  def up
    change_column :parties, :arrival, :string
  end
end
