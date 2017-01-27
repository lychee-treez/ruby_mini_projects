#merge-sort using recursion
def merge_sort(arr) 
	#if theres 1 value its sorted
	if arr.length <= 1
		return arr
	end

	#split array into 2
	left,right = arr.each_slice( (arr.size/2.0).round ).to_a

	#run merge-sort on each half
	a = merge_sort(left)
	b = merge_sort(right)

	#merge the two resulting arrays
	return_array = merge(a,b)	

end

def merge(arr1, arr2)
	#array to merge values into
	return_array = []

	loop do 
		#check when to
		if arr1.empty? 
			arr2.each {|x| return_array << x}
			break
		elsif arr2.empty? 
			arr1.each {|x| return_array << x}
			break
		end

		#compare the first of each to see which is bigger
		arr1.first < arr2.first ? return_array << arr1.shift : return_array << arr2.shift
	end
		
	return return_array
end


print merge_sort(Array.new(35) { rand(1..36) })