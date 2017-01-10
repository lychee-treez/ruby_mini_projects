#takes a string and a rotation value and encrypts the string
#by shifting each letter by the amount of characters specified
#by the rotational value

def ceasar_cipher (string, shift)

	#split into words
	words = string.split(" ")

	#create storage for hidden words
	new_words = []

	words.each do |word|

		#string to reassemble letters after shift
		temp_string = " "

		word.each_char do |letter|

			#only shift if the "letter" is in fact a letter
			if ( letter =~/[A-Za-z]/ )

				#find base value to rotate around
				if (letter=~/[A-Z]/) 
					index = 'A'.ord
				elsif (letter=~/[a-z]/) 
					index = 'a'.ord
				end

				#get numerical value of letter
				value = (letter.ord - index)

				#update value (loop around after z)
				updated = ((value + shift)%26) + index

				#convert value back to letter
				new_letter = updated.chr("UTF-8")

				#append letter to string
				temp_string << new_letter

			else

				temp_string << letter

			end

		end

		#add new word to array
		new_words << temp_string

	end

	#join words to form sentence
	crypt = new_words.join(" ")

	return crypt

end

puts ceasar_cipher("Dont you wish You didn't waste time deciphering THIS!?", 15)