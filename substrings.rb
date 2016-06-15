#!/usr/bin/ruby

def substrings(theWord, dictionary)
	#this shows how many times the word and any substrings appear in the StringsArray
	return "Please enter a valid array" unless dictionary.is_a? Array 
	return "Please enter a valid string" unless theWord.is_a? String 

	theSentence_Array = theWord.split(" ")
	word_Counter = Hash.new(0)

	theSentence_Array.each do |word|
		theWord_Array = word.split("")
		theWord_Size = theWord_Array.length

		dictionary.each do |element|
			element_Size = element.length #4
			if element_Size <= theWord_Size
				#This is the array of the word in the dictionary
				element_Array = element.split("") 
				i = 0
				theWord_Size.times do 
					word_container = theWord_Array.slice(i, element_Size) 
					if word_container.join.downcase == element_Array.join
						word_Counter[word_container.join] += 1
					end
					i += 1
				end
			end
		end
	end
	puts word_Counter
end


dictionary = ["below", "down","go","going","horn","how","howdy","it","i","low","part","own", "partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)