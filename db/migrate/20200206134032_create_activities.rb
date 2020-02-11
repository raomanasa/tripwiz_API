class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :rating
      t.string :lat
      t.string :lng
      t.references :activity_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
