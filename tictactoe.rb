



class TicTacToe

	def initialize
		@board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
		@winner = false
	end

	#def board
	#	puts @board
	#end

	def show_board
		puts "

		#{@board[7]} | #{@board[0]}  | #{@board[0]}
		-----------
		#{@board[0]} | #{@board[0]}  | #{@board[0]}
		-----------
		#{@board[0]} | #{@board[0]}  | #{@board[0]}"
	end

	def start_game 
		x = true
		#the turn mechanism works
		until @winner do 
			if x
				player = 'X'
				x = false
			elsif !x
				player = 'O'
				x = true
			end

			puts "player #{player} plays box # :"
			box = gets.chomp.to_i
			puts "1 Please input a valid box number between 0 and 8" unless box.is_a? Integer
			puts "2 Please input a valid array" unless (box < 9 && box >= 0)
			puts "cool"
			
			@winner = true
		end
	end

	def victory
		
	end



end




bum = TicTacToe.new

bum.show_board
bum.start_game