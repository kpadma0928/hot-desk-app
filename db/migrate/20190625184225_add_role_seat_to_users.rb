class AddRoleSeatToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :role, :integer
  	add_column :users, :seat_from_date, :date
  	add_column :users, :seat_end_date, :date
  	add_column :users, :seat_id, :integer
  	
  end
end
