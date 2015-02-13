class SpeakersController < ApplicationController

	before_action :set_speaker, only: [:show]

	def index
    	@speakers = Speaker.all
  	end

  	def show
  	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_speaker
	      @speaker = Speaker.find(params[:id])
	    end	

end
