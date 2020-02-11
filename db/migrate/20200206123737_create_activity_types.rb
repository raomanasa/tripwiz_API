class CreateActivityTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_types do |t|
      t.string :activity_type
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
