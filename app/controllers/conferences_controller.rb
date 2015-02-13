class ConferencesController < ApplicationController

	def index
    	@conferences = Conference.all
  	end
end
