def bubble_sort_by(array)
	return "Please input a valid array" unless array.is_a? Array
	swapped = true
	while swapped do
		swapped = false
		for index in 0..array.length - 2
			puts array[index]
			y = yield(array[index], array[index+1])
				#HERE WE YIELD TO THE BLOCK AND PASS IT array[i] AND array[i+1] AS first AND second IN THE BLOCK
			if y == 1
				array[index], array[index +1]  = array[index +1], array[index]	
				swapped = true
			end
		end
	end
	puts array.to_s
end

#bubble_sort_by([2, 3, 1, 56, 2, 8])
bubble_sort_by(["hi", "hello", "hey", "jim", "jimminyfuckincricket", "monsta"]) {|first, second| first.length <=> second.length}

