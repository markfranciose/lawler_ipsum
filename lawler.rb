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
	
	def self.better_words(number = 100)
		lines = []
		File.open(File.dirname(__FILE__) << '/wrestlers.txt').each_line do |line|
			lines << line.gsub!(/\n/, " ")
		end

		lines.shuffle.join("")
				
	end

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
	
	def self.yet_better()
		pick_wrestler + " " + @@verbs.sample + " " + pick_wrestler + " with a " + pick_move + "!"
		# select from verb
		# select from wrestler name array
		# with a
		# select from moves
	end



	private

	class Loader
		
	end
	


end


puts LawlerIpsum.yet_better
