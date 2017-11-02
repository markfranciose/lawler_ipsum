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
	
	def self.yet_better(number)
		output = ""
		number.times do
			output += pick_wrestler + " "
			output += @@verbs.sample + " "
			output += pick_wrestler + " "
			output += "with a " + pick_move
			output += "! "
		end
		output
	end

	private

	class Loader
		
	end
	


end
