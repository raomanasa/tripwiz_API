class AddDaysToTrip < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :days, :integer
  end
end
