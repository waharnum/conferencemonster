class CreateSessionSpeakers < ActiveRecord::Migration
  def change
    create_table :sessions_speakers, id:false do |t|
    	t.integer :session_id
    	t.integer :speaker_id 
    end
    add_index :sessions_speakers, [:session_id, :speaker_id]
  end
end
