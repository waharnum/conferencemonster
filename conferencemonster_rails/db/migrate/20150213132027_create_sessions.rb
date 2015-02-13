class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
