class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :title
      t.text :description
      t.date :date

      t.timestamps null: false
    end
  end
end
