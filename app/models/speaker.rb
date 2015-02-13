class Speaker < ActiveRecord::Base
	validates :last_name, presence: true
	validates :first_name, presence: true
	has_and_belongs_to_many :sessions
	def name
		"#{last_name}, #{first_name}"
	end
end
