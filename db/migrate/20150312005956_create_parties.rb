class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :location
      t.date :arrival
      t.integer :age
      t.text :weekends
      t.text :fives
      t.text :dealbreakers
      t.timestamps
    end
  end
end
