#create an enumerable model that can be added to a class (like array/hash)
module Enumerable

	#accesses each thing in an object and performs some action (described in the block)
	#on it
	def my_each
		i = 0
		while i < self.size 
			yield(self[i])
			i+=1
		end
		return self
	end

	#same as above, exept it allows access to the index value as well
	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i+=1
		end
		return self
	end

	#selects certan values from the object (based on some criteria)
	#and creates an array of those values
	def my_select
		return_array = []
		i = 0
		while i < self.size
			if yield(self[i])
				return_array.push(self[i])
			end
			i += 1
		end
		return return_array
	end

	#checks if the block is true for all values (returns true/false)
	def my_all?
		status = true
		i = 0
		while i < self.size
			unless yield(self[i])
				status = false
			end 
			i += 1
		end
		return status
	end

	#checks if the block is true for any of the values (returns true/false)
	def my_any?
		status = false
		i = 0
		while i < self.size
			if yield(self[i])
				status = true
			end
			i += 1
		end
		return status
	end

	#returns true if none of the values meet criteria in block (false otherwise)
	def my_none?
		status = true
		i = 0
		while i < self.size
			if yield(self[i])
				status = false
			end
			i += 1
		end
		return status
	end

	#returns an integer representing the number of values that 
	#meet the criteria in the block
	def my_count
		count = 0
		i = 0
		while i < self.size
			if yield(self[i])
				count += 1
			end
			i += 1
		end
		return count
	end

	#creates a new array with modified values from origional
	#modification described in the block
	def my_map
		return_array = []
		i = 0
		while i < self.size 
			return_array << yield(self[i])
			i += 1
		end
		return return_array
	end

	#combine elements by using some operation (specified in block)
	def my_inject
		current_value = self[0]
		i = 0
		while i < self.size - 1
			current_value = yield(current_value, self[i + 1])
			i += 1
		end
		return current_value
	end
end