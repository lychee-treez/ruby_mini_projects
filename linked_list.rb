class LinkedList

	attr_accessor :head

	def inititalize(data = nil)
		@head = Node.new(data, nil) if data != nil
		@head = nil		
	end

	def append(data)
		#create new node (pointing to nil because its at the end)
		node = Node.new(data, nil)

		#if the list is empty point head at node
		if @head == nil
			@head = node
			return 
		end

		#go through the list until it points to nil
		#then point to the node (which points to nil)
		temp = @head
		until temp.next_node.nil?
			temp = temp.next_node
		end

		temp.next_node = node

		return self
	end

	def prepend(data)
		#create new node that points to the head of the list
		node = Node.new(data, @head)
		#make this node the head of the list
		@head = node
		return self
	end

	def size
		#variable to store sume
		sum = 0
		#create a temp variable that points to the beginning of the list
		temp = @head

		#until the list is empty add 1 to sum and move to the next node
		until temp.nil?
			sum += 1
			temp = temp.next_node
		end
		#return the sum
		sum
	end

	def head
		#easy peasy
		return @head.value
	end

	def tail
		#create a temp variable that points to the first node in the list
		temp = @head

		#keep going thru the list until the node points to nil
		#return the value of that node
		until temp.next_node.nil?
			temp = temp.next_node
		end
		return temp.value
	end

	#find value in list using 0 based index
	def at(index)
		temp = @head

		return temp.value if index == 0

		index.times do 

			if temp.nil? 
				return "index doesn't exist"
				break
			end

			temp = temp.next_node			

		end

		return temp.value
	end

	def pop
		temp = @head

		return "list empty" if temp.nil?

		until temp.next_node.nil?
			prev = temp
			temp = temp.next_node
		end

		prev.next_node = nil

		return temp
	end

	def contains?(data)
		bool = false
		temp = @head

		return "list empty" if temp.nil?

		until temp.nil?
			bool = true if temp.value == data
			temp = temp.next_node
		end

		return bool
	end

	def find(data)
		temp = @head
		index = 0

		until temp.nil?
			return index if data == temp.value

			temp = temp.next_node
			index += 1
		end

		return "Not found"
	end

	def to_s
		#traverse the nodes and store value in array
		result = ""
		travel = @head

		#check if empty
		until travel.nil?
			result << "#{travel.value} => "
			travel = travel.next_node
		end

		result << "END"
		result

	end
end


#structure of my nodes
class Node
	attr_accessor :value, :next_node
	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end
end

#bunch of testing methods

list = LinkedList.new

list.append(30)
list.append(15)
list.append(25)
list.prepend(10)
list.prepend(5)

print "the list has #{list.size} elements"

print "\n"

print list.to_s

#print list.head

print "\n"

print list.tail

print "\n"

print list.head

print "\n"

print list.at(3)

print "\n"

list.pop

print list.to_s

print "\n"

print list.contains?(15)

print "\n"

print list.find(30)