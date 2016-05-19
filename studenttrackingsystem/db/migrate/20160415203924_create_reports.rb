class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :student, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
