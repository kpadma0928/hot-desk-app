class CreateSeats < ActiveRecord::Migration[5.2]
  def change
  	drop_table :seats
    create_table :seats do |t|
      t.string :name

      t.timestamps
    end
  end
end
