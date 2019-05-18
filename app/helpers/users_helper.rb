module UsersHelper

	#Add new cards to the users deck, if they have not already studied today
	def addnewcards(user)
		if user.laststudied != Date.today
			cardsneeded = 8 - user.cardstates.where(successes:-1).count	
			cardsneeded.times do 
				user.cardstates.where(successes: -2).first.update(successes: -1)
			end
			user.update(laststudied: Date.today)
		end
	end

end
