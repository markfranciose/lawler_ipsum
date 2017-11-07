module LawlerIpsum

	@@verbs = [
		"smacks",
		"hits",
		"bams",
		"wallops",
		"strikes",
		"counters",
		"reaches deep, deep down and lays out"
	]

	@@anytime = [
		"What a slobberknocker!",
		"That had to hurt!",
		"My gawd!",
		"Oh come on now!",
		"Did the ref not see that?!",
		"What a match!",
		"No love lost between these two.",
		"You know he felt that.",
		"Ouch!",
		"I can't believe it!"
	]
	
=begin
	def self.list_wrestlers
		File.open(File.dirname(__FILE__) << '/wrestlers.txt')
	end
=end

	def self.pick_wrestler
		wrestlers = []
		File.open(File.dirname(__FILE__) << '/wrestlers.txt').each_line do |line|
			wrestlers << line.gsub(/\n/, "")
		end

		wrestlers.sample
	end
	
	def self.pick_move
		moves = []
		File.open(File.dirname(__FILE__) << '/moves.txt').each_line do |line|
			moves << line.gsub(/\n/, "")
		end

		moves.sample
	end
	
	def self.get_sentences(number = 5)
		output = ""
		wrestler_one = pick_wrestler
		wrestler_two = pick_wrestler
		until wrestler_one != wrestler_two
			wrestler_two = pick_wrestler
		end
		move = pick_move
		number.times do
			output += "#{wrestler_one} #{@@verbs.sample} #{wrestler_two} "
			output += "with #{article(move)} #{move}! "
		end
		output
	end

	def self.article(word)
		/^[aeiou]/i =~ word ? "an" : "a" 
	end

	def self.get_paragraph(number = 1)
		output = ""
		number.times do
			rand(4..7).times do
				output += get_sentences(1)
			end
			output += "\n\n"
		end
		output
	end

	private

	class Loader
		
	end
	


end
