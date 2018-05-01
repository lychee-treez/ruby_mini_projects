def bubble_sort (array)

#create a copy of the inputted array ti return
copy = array

#create variable for index and the amount of the list that is unsorted
index = 0
unsorted = copy.size
swap = true
	#keep in this loop until the swap returns false
	while swap
		swap = false
	 	#if the left value is greater than the right swap values
	 	while index < unsorted - 1
	 		if copy[index] > copy[index + 1]
	 			copy[index], copy[index + 1] = copy[index+1], copy[index]
	 			swap = true
	 		end
	 		index += 1
	 	end 
	 	#decrement unsorted because the biggest number should be at the end now
	 	unsorted -= 1
	 	#restart the index variable
	 	index = 0
	end
	return copy
end


#same thing just takes also takes a block
def bubble_sort_by (array)
#create a copy of the inputted array ti return
copy = array

#create variable for index and the amount of the list that is unsorted
index = 0
unsorted = copy.size
#variable to check if there has been a swap
swap = true
	#keep in this loop until swap returns false
	while swap
		swap = false
	 	#if the left value is greater than the right swap values
	 	while index < unsorted - 1
	 		if yield(copy[index], copy[index+1]) > 0
	 			copy[index], copy[index + 1] = copy[index+1], copy[index]
	 			swap = true
	 		end
	 		index += 1
	 	end 
	 	#decrement unsorted because the biggest number should be at the end now
	 	unsorted -= 1
	 	#restart the index variable
	 	index = 0
	end
	return copy
end
	
sort_me = [9,4,7,8,1,3,6,5,2]

print bubble_sort(sort_me)

sort_me_pt2 = ["hi", "hello", "hey"]

by_length = bubble_sort_by(sort_me_pt2) do |left, right|

	left.length - right.length

end

print by_length
