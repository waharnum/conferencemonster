class ExamplePagesController < ApplicationController
  def conferences  	
  	@conferences = Conference.all  	
  end
end
