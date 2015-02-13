class Session < ActiveRecord::Base
	validates :title, presence: true
	has_and_belongs_to_many :speakers
	belongs_to :conference
end
