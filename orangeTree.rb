
class OrangeTree

	def initialize
		@height = 1
		@age = 0
		@oranges = 0
	end

	def height
		puts "Height of tree is #{@height} meters"
	end

	def age
		puts "Your tree is #{@age} years old"
		
	end

	def oneYearPasses
		if @oranges > 0
			puts "All our oranges fell off... We should eat them next year!"
			@oranges = 0
		end
		
		if @age <= 9
			@age +=1

			if @age >= 2 && @age <=6
				@oranges += 1
				puts "An orange grew on the orange tree!"
			elsif @age >= 7
				@oranges += 3
				puts "SO MANY ORANGES GREW THIS YEAR"
			end

			if @height <= 4
				@height += 1
			else
				@height +=3
			end
		elsif @age >= 10
			puts "The tree died... Sorry... Probably the flu."
			puts "A new orange tree grew over its rotting corpse"
			@height = 1
			@age = 0
			@oranges = 0
		end
	end

	def countTheOranges
		puts "There are #{@oranges} oranges in our tree!" 
	end

	def pickAnOrange
		if @oranges > 0
			@oranges -= 1
			puts "mmmmh tasty orange"
		elsif @oranges == 0
			puts "THERE ARE NO ORANGES IN THE TREE!!! WAAAAAAH"
		end
	end

end
