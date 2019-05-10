class StaticPagesController < ApplicationController

	def setup
		@var = "borgon"
	end
	
  def home
		#render html: "this is the word of the day: #{@var}"
  end

  def help
  end

	def about 
	end
end
