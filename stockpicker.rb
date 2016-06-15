#!/usr/bin/ruby
def stock_picker(stocksArray)
	#find the buy and sell days that will maximize your profit. 
	#Need to buy before you can sell

	return "Please enter a valid array of stock prices" unless stocksArray.is_a? Array 

	days = (0..stocksArray.length-1).to_a
	profits=[]
	max_profits = 0
	buy = 0
	sell = 0

	days.each do |day1|
		days.each do |day2|
			if day2 > day1
				profits << -stocksArray[day1]+stocksArray[day2]
				if profits.last == profits.max
					max_profits = profits.max
					buy = day1
					sell = day2
				end

			end
		end
		
	end
	puts "Buy on day #{buy}, then sell on day #{sell} for profits of #{profits.max}"
end
