def bubble_sort(arr)
	return "Please input a valid array" unless arr.is_a? Array
	runthroughs = arr.length - 1
	counter = 0
	while counter < runthroughs
		runthroughs.times do |index|
			puts index
			if arr[index] >= arr[index +1]
				arr[index], arr[index +1]  = arr[index +1], arr[index]	
			end
		end
		counter += 1
	end
	puts arr.to_s
end


array_example = [4,3,78,2, 8]
bubble_sort(array_example)
