class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.string :price
      t.string :address
      t.string :url

      t.timestamps
    end
  end
end
