class ConferencesController < ApplicationController

	before_action :set_conference, only: [:show]

	def index
    	@conferences = Conference.all
  	end

  	def show
  	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_conference
	      @conference = Conference.find(params[:id])
	    end	

end
