
def cypher(message_to_encrypt, shift_factor)
	return "Invalid arguments" unless message.is_a?(String) && shift.is_a?(Integer)

	jumble = message_to_encrypt.downcase.split(//)
	converted = Array.new
	shifted = Array.new

	jumble.each do |letter|
		this = letter.ord
		converted << this.to_i
	end

	converted.each do |number|
		if number > 96 && number < 123
			number += shift_factor.to_i
			if number > 122
				number = 98 + (number - 122)
			end
			shifted << number.chr
		else
			shifted << number.chr
		end
	end
	puts shifted.join
	puts " "
end

puts "Enter the messaged to be encrypted..."
message = gets.chomp
puts "Enter the shift factor..."
shift = gets.chomp

cypher(message, shift)