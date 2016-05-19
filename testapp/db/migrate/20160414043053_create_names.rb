class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :title
      t.string :first
      t.string :last

      t.timestamps null: false
    end
  end
end
