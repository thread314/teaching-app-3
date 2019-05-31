module UsersHelper

	def addnewcards(user)
    if user.laststudied != Date.today && user.cardstates.where(successes: -2).count > 0
			cardsneeded = 15 - user.cardstates.where(successes:-1).count	
			cardsneeded.times do 
				user.cardstates.where(successes: -2).first.update(successes: -1)
			end
		end
    user.update(laststudied: Date.today)
	end

	def getnextcard(user)
    if nextcard = user.cardstates.where(successes: -1).first
			return nextcard
    elsif allcards = user.cardstates.where("successes > ?", -1).order(:updated_at, :id)
      allcards.find{|i| i.lastsuccess.nil? || (i.lastsuccess + i.successes) <= Date.today}
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
