#takes stock prices as an array (one per day), and determines when to buy/sell to earn
#the maximum profit possible

def stock_picker(prices_array)

	#iterator variable
	buyDay, sellDay = 0,0


	#result variables
	maxProfit, profitBuyDay, profitSellDay  = 0,0,0



	while buyDay < prices_array.size 

		sellDay = buyDay + 1

		while sellDay < prices_array.size

			#calculate profit
			profit = prices_array[sellDay] - prices_array[buyDay]
	
			if profit > maxProfit

				maxProfit = profit

				profitSellDay = sellDay

				profitBuyDay = buyDay

			end
			sellDay += 1
		end
		buyDay += 1
	end

	return "If you buy on day #{profitBuyDay + 1} and sell on day #{profitSellDay + 1} you earn a maxProfit of #{maxProfit}"

end

arr = [15, 12, 7, 8, 13, 11, 4, 6, 19, 3, 5]



puts stock_picker(arr)