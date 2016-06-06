

class TimesUp

	def initialize
		@hat = []
		@basehat = []
		@round = 0
	end

	def NewWord(word)
		@hat.push(word)
		@basehat.push(word)
		return true
	end

	def grab
		if @hat.empty?
			puts "End of round!"
		else
			l = @hat.length
			word = rand(l)
			puts @hat[word]
			@hat.delete_at(word)
		end
	end

	def printout
		puts @hat
	end

	#here is where i try to set the game array to the 'base' array. 
	def refresh
  		@hat = @basehat.dup
  		#here we set the hat instance variable to a DUPLICATE of the basehat instance variable so that the actual variable IS UNCHANGED
  		@basehat = @basehat.dup
	end

	def rounds
		@round = @round + 1
		puts "Welcome to round #{@round}!"
		#while @hat.epmty? = false do
		#end
	end
end

puts "Welcome To a New Game ooooooooooof...."
puts "Time's Up!!"
puts "(applause)"
#In order to start a game you must create an instance method. For some reason, when I do the line below and run the script, the program doesn't recognize that game is an object.
game = TimesUp.new
