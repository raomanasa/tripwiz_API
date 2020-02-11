class AddTripToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :trip_id, :integer
  end
end
