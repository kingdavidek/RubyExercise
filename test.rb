

array = [1, 2, 3, 4, 5]
red = []

red = array.select { |el|  el<=3 }

puts red.to_s


		if block_given?
			for i in 0..self.length-1
				if yield(self.to_a[i]) true
					return true
					break
				end
			end
		end