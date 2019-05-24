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

	def getnextcard(user)
		nextcard = user.cardstates.where(successes: -1).first
		if !nextcard.nil?
			return nextcard
		end
		nextcard = user.cardstates.where("successes > ?", -1).order(:updated_at, :id ).first
		puts nextcard.class
		if !nextcard.nil?
			return nextcard
		end
	end
	
	def separatequestion(question)
 		return question.split(/(?=\{)|(?<=\})/)
 	end

	def classifyelement(element)
		if element[0] == "{" && element[-1] == "}"
			return "answer-text"
		else
			return "plaintext"
		end
	end



end
