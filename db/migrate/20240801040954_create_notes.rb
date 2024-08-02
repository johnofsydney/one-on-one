class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.references :event, null: false, foreign_key: true
      t.integer :manager_id
      t.integer :report_id
      t.text :content

      t.timestamps
    end
  end
end
