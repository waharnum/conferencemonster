class SessionsController < ApplicationController

	before_action :set_conference_session, only: [:show]

	def index
    	@sessions = Sessions.all
  	end

  	def show
  	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_conference_session
	      @session = Session.find(params[:id])
	    end	

end
