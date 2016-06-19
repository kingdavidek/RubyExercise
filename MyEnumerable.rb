

module Enumerable
	def my_each(&block)
		if block_given?
			for i in 0..self.length-1
				yield(self.to_a[i])
			end
		end
	end

	def my_each_with_index(&block)
		if block_given?
			for i in 0..self.length-1
				yield(self.to_a[i], i)
			end
		end
	end
end


array = [1, 2, 3, 4, 5]
array.my_each_with_index {|el, index| puts el.to_s + ' ' + index.to_s}

#my_each:
# 	accepts a block
#  	take each element of the array
# 	apply block to each element of the array