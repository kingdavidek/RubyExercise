class Warrior
	MAX_HEALTH =120
	def heal
		self.health +=1 unless self.health + 1 > MAX_HEALTH
	end
end


class Viking < Warrior
	@@starting_health = 120
	attr_reader :name, :age, :health, :strength, :dead
	def initialize(name, age, health, strength)
		@name = name
		@age = age
		@health =  @@starting_health
		@strength = strength
		@dead = false
	end

	def heal
		2.times {super}
		#the 'super' keyword calls the method from the parent class
		#so it only works if the parent class has a method of that name
	end

	#class methods are denoted by a self 
	#because what is being referred to is the class, not the instance
	def self.create_warrior(name)
		age = rand*20 + 15
		health = [age *5, 120].min
		strength = [age/2, 10].min
		Viking.new(name, health, age, strength) 
	end

	#another less common use of class methods 
	def self.random_name
		["Erik", "Lars", "Leif"].sample
		#we can generate a random name using this class method
		#without actually having an instance
	end

	def warcry
		puts "AAAAARGHGRH!!!"
	end

	def attack(object)
		if object.dead
			puts "he's already dead!"
			return false
		elsif object.is_a? Object
			damage = (rand*10+10).round(0)
			object.lose_health(damage)
		end
	end

	protected

	def lose_health(num)
		if num.is_a? Integer
			#remember self is whatever the object is called. 
			#Here it is the particular instance of the Viking or Roman
			#it is referring to the instance because the method is being called on the instance.
			@health -= num
			puts "#{self.name} took #{num} damage!"
			die if @health <= 0 
		end
	end

	private
	def die
		puts "#{self.name} has been killed :( "
			@dead = true
	endLeif.
end


class Roman < Viking
	def self.random_name
		["Titinus", "Caecelius", "Addus"].sample
		#we can generate a random name using this class method
		#without actually having an instance
	end

	def warcry
		#overriding
		puts "LILILILILII!!!"
	end
end
