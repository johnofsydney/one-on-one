class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true
      t.references :manager, null: false, foreign_key: true
      t.integer :preferred_day
      t.integer :preferred_hour

      t.timestamps
    end
  end
end
