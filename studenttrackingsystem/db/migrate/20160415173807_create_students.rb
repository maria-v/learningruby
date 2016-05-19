class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.text :first_name
      t.string :last_name
      t.boolean :is_hired
      t.string :job_title
      t.date :start_date
      t.float :starting_salary
      t.text :city
      t.string :state

      t.timestamps null: false
    end
  end
end
