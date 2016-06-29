

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

	def my_map(*p)
		container = []
		if block_given?
			self.my_each { |i| container << yield(i) }
			return container.to_a
		elsif p[0].is_a? Proc
			self.my_each { |i| container << p[0].call(i) }
			return container.to_a.to_s
		end
	end

	def my_inject(*p)
		if block_given?
			aggr = p[0]
			self.my_each do |i| 
				aggr = yield(aggr, i) 
			end
			return aggr
		end
	end
end


array = [1, 1, 3, 3, 3, 1, 9, 8, 51]
#array.my_each_with_index {|el, index| puts el.to_s + ' ' + index.to_s}

#if array.my_none { |el|  el > 2 }
#	puts 'true it is'
#else
#	puts 'false it be'
#end

#counts the number of elements

array.my_count {|el| el < 4}
red = Proc.new {|el| el*4}
x = array.my_map(red)
puts x

puts array.my_inject(0) {|total, el| total + el}

arrayz = [1, 2, 3, 4, 5, 6].my_inject([]) do |result, element|
  result << element.to_s if element % 2 == 0
  result
end


def multiply_els(arr)
	arr.my_inject(1) {|result, el| result*el}
end
