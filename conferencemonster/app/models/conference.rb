class Conference < ActiveRecord::Base
	validates :title, presence: true
	validates :date, presence: true
	has_many :sessions
end
