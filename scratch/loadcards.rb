userid = User.first.id
File.open("scratch/questionstoadd").each do |i|
	puts i
	newcard = Card.create
	newcard.levels.create(question: i)
	newcard.cardstates.create(successes: -2, user_id: userid)
  File.open("scratch/addedquestions","a") do |line|
    line.puts "\r" + i
  end
end
File.open('scratch/questionstoadd', 'w') {|file| file.truncate(0) }
