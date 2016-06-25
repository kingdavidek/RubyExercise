

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

	def my_any
		if block_given?
			for i in 0..self.length-1
				returnvar = false
				if yield(self.to_a[i]) == true
					returnvar = true
					break
				end
			end
			return returnvar
		end
	end

	def my_none
		if block_given?
			returnvar = true
			self.my_each do |i|
				puts i
				if yield(i) 
					returnvar=false
					break
				end
			end
			return returnvar
		end
	end

	def my_count(*p) #this will give a default argument of p=[] if no other arguments are given
		count = 0
		if block_given?
			self.my_each {|i| count += 1 if yield(i) }
		elsif p == []
			self.my_each { count += 1 }
		elsif p.length == 1
			self.my_each { |i| count+=1 if i == p[0] }
		end
		return count
	end
end


array = [1, 1, 3, 3, 3, 1, 4, 2, 1]
#array.my_each_with_index {|el, index| puts el.to_s + ' ' + index.to_s}

#if array.my_none { |el|  el > 2 }
#	puts 'true it is'
#else
#	puts 'false it be'
#end

#counts the number of elements

puts array.my_count {|el| el < 4}
puts array.my_count