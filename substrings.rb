#takes a string and an array as input
#the array represents a dictionary of words
#the method returns a hash which included which words
#fron the dicitonary were in the string and how many
#times each was in there

def substrings (input, dictionary)

	#make everthing lowercase
	input.downcase!
	dictionary.each do |x|
		x.downcase!
	end

	#splits sentences and stores words in array
	words = input.split(" ")

	#creates the hash to store the amount of times each substring is found
	frequencies = Hash.new(0)


	words.each do |word|

		dictionary.each do |sub|

			#check if the dictionary 
			if word =~ /#{sub}/ 

				frequencies[sub] += 1

			end
		end
	end

	return frequencies.sort_by {|x,y| y}

end



dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

input = "Howdy partner, sit down! How's it going?"

substrings(input, dict).each do |x,y|
	puts "#{x}: #{y}"
end