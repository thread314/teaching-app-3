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
    if nextcard = user.cardstates.where(successes: -1).first
			return nextcard
    elsif allcards = user.cardstates.where("successes > ?", -1).order(:updated_at, :id)
      allcards.find{|i| i.lastsuccess.nil? || (i.lastsuccess + i.successes) < Date.today}
    else
      return nil
		end
	end
	
	def separatequestion(question)
    output = {}
    output["complete"] = question.split(/(?=\{)|(?<=\})/)
    answer = output["complete"].reject { |i| i[0] != "{" }
    output["answer"] = answer[0][1..-2]
    return output
 	end

	def classifyelement(element)
		if element[0] == "{" && element[-1] == "}"
			return "answer-text"
		else
			return "plaintext"
		end
	end



end
