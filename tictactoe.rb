
class TicTacToe

	def initialize
		@board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
		@winner = false
		@x = true
		@player = 'X'
	end

	def show_board
		puts "

		#{@board[0]} | #{@board[1]}  | #{@board[2]}
		-----------
		#{@board[3]} | #{@board[4]}  | #{@board[5]}
		-----------
		#{@board[6]} | #{@board[7]}  | #{@board[8]}"
	end

	def start_game 
		#the turn mechanism works
		until @winner do 
			self.turn
			puts "player #{@player} plays box # :"
			box = gets.chomp.to_i
			#turns box variable into an integer and sets box=0 if it can't do so
			if box > 9 || box < 1
				puts "Error: please input a valid box number between 0 and 9"
				self.turn
			elsif self.put_into_box(box, @x) == false
				puts "Error: please input a box number that is NOT taken."
				self.turn
			else
				self.put_into_box(box, @x)
				self.show_board
			end
			#@winner = true
		end
	end

	def turn
		if @x
			@player = 'X'
			@x = false
		elsif !@x
			@player = 'O'
			@x = true
		end
	end

	def put_into_box(num, x)
		num -= 1
		if @board[num] != nil
			return false
		end
		if x
			@board[num] = 'O'
		else
			@board[num] = 'X'
		end
	end

	def victory
		
	end



end




bum = TicTacToe.new
bum.start_game