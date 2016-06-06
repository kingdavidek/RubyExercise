puts "Please enter something"
text = gets.chomp

words = text.split

#We set '0' as the default Hash value for any keys that it may have now or in the future
frequencies = Hash.new(0)

words.each do |word|
	#apparently this line both sticks the word in the Hash and augments the number associated with it. 
    frequencies[word] += 1
end

frequencies = frequencies.sort_by do |word, count|
    count
end

frequencies.reverse!

frequencies.each do |word, count|
    puts word + " " + count.to_s
end