class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :last_name
      t.string :first_name

      t.timestamps null: false
    end
  end
end
