#class to draw, update and check the board
class Board
	#possible winning combinations
	@@win = 
	[ 
		[1,2,3], [4,5,6], [7,8,9], #horizontal wins
    	[1,4,7], [2,5,8], [4,6,9], #vertical wins
    	[1,5,9], [3,5,7]			#diagonal wins
	]

	#initialied the board as an array with all values as spaces
	def initialize
	@pos = 
		[
		" ", " ", " ", 
		" ", " ", " ",
		" ", " ", " "
		]
	end

	#draws the board to the based on the pos array
	def draw 
		puts " #{@pos[0]} | #{@pos[1]} | #{@pos[2]} "
		puts "___________"
		puts " #{@pos[3]} | #{@pos[4]} | #{@pos[5]} "
		puts "___________"
		puts " #{@pos[6]} | #{@pos[7]} | #{@pos[8]} "
	end

	#draws a board showing the number representing each position
	def draw_indicies
		puts " 1 | 2 | 3 "
		puts "___________"
		puts " 4 | 5 | 6 "
		puts "___________"
		puts " 7 | 8 | 9 "
	end

	#places an X in the inputed position
	def placeX(position)
		@pos[position-1] = "X"
	end

	#places and O in the inputed position
	def placeO(position)
		@pos[position-1] = "O"
	end

	#get the value stores in the entered position
	def get_value(position)
		return @pos[position-1]
	end

	#check if the inputted position is empty
	def is_empty?(position)
		if @pos[position-1] == " "
			return true
		else
			return false
		end
	end

	#check if it is a tie
	def tie
		status = true
		for x in (1..9) do
			if self.is_empty?(x)
				status = false
			end
		end
		return status
	end

	#check if X won
	def xWins
		status = false
		@@win.each do |x|
			if @pos[x[0]] == "X" && @pos[x[1]] == "X" && @pos[x[2]] == "X"
				status = true
			end
		end
		return status
	end

	#check if O won
	def oWins
		status = false
		@@win.each do |x|
			if @pos[x[0]] == "O" && @pos[x[1]] == "O" && @pos[x[2]] == "O"
				status = true
			end
		end
		return status
	end

end

board = Board.new



#introduction to the game
puts ""
puts "Welcome to Tic-Tac-Toe!"
puts ""
board.draw_indicies
puts ""
puts "The board is formatted as above." 
puts "Input the number of the space that you would like to choose!"
puts ""
puts "X goes first!"

#main game loop
game_over=false
until game_over

	#X's turn
	puts "Where would you like to place your X?"
	pick = gets.chomp

	#check input is valid
	while (1..9) === pick 
		puts "Only numbers between 1 and 9!"
		pick = gets.chomp
	end

	#check if spaces is occupied
	until board.is_empty?(pick.to_i)
		puts "There's something there already!"
		pick = gets.chomp
	end


	board.placeX(pick.to_i)
	board.draw

	if board.xWins
		puts "X won!"
		game_over = true
		break
	end

	if board.tie 
		puts "It's a tie. You both suck"
		game_over = true
		break
	end

	#O's turn
	puts "Where would you like to place your O?"
	pick = gets.chomp

	#make sure input is valid
	while (1..9) === pick
		puts "Only numbers between 1 and 9!"
		pick = gets.chomp
	end

	#check if spaces is occupied
	until board.is_empty?(pick.to_i)
		puts "There's something there already!"
		pick = gets.chomp
	end

	board.placeO(pick.to_i)
	board.draw

	if board.oWins
		puts "O won!"
		game_over = true
		break
	end
end

