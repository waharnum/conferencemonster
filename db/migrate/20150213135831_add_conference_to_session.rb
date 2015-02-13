class AddConferenceToSession < ActiveRecord::Migration
  def change
  	add_reference :sessions, :conference, index: true
  end
end
