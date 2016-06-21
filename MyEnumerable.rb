

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

	def my_select
		if block_given?
			container = []
			for i in 0..self.length-1
				if yield(self.to_a[i]) == true
					container << self.to_a[i]
				end
			end
			return container
		end
	end

	def my_all
		if block_given?
			for i in 0..self.length-1
				if yield(self.to_a[i]) == false
					return false
					break
				else
					return true
				end
			end
		end
	end
end


array = [1, 2, 3, 4, 5, 4, 2, 6]
#array.my_each_with_index {|el, index| puts el.to_s + ' ' + index.to_s}

red = []

if array.my_all { |el|  el < 8 }
	puts 'true it is'
else
	puts 'false it be'
end
