class AddMinPriceMaxPriceToActivityType < ActiveRecord::Migration[6.0]
  def change
    add_column :activity_types, :max_price, :integer
  end
end
