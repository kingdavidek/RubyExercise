
class TicTacToe

	def initialize
		@board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
		@victory = false
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
		until @victory do 
			self.turn
			self.show_board
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
			end
			self.victory
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
		x_win = Proc.new do 
			@victory=true
			self.show_board
			puts "Player X Wins!"
		end

		o_win = Proc.new do 
			@victory=true
			self.show_board
			puts "Player O Wins!"
		end

		case
		when @board[0..2].all? {|el| el == 'X'} || @board[3..5].all? {|el| el == 'X'} || @board[6..8].all? {|el| el == 'X'}
		#horizontal victory
			x_win.call
		when @board[0..2].all? {|el| el == 'O'} || @board[3..5].all? {|el| el == 'O'} || @board[6..8].all? {|el| el == 'O'}
			o_win.call
		when (@board[0] == @board[3]) && (@board[3] == @board[6]) && @board[3] == 'X'
		#vertical victory
			x_win.call
		when (@board[1] == @board[4]) && (@board[4] == @board[7]) && @board[4] == 'X'
			x_win.call
		when (@board[2] == @board[5]) && (@board[5] == @board[8]) && @board[5] == 'X'
			x_win.call
		when (@board[0] == @board[3]) && (@board[3] == @board[6]) && @board[3] == 'O'
		#vertical victory
			o_win.call
		when (@board[1] == @board[4]) && (@board[4] == @board[7]) && @board[4] == 'O'
			o_win.call
		when (@board[2] == @board[5]) && (@board[5] == @board[8]) && @board[5] == 'O'
			o_win.call
		when (@board[0] == @board[4]) && (@board[4] == @board[8]) && @board[4] == 'X'
		#diagonal victory
			x_win.call
		when (@board[2] == @board[4]) && (@board[4] == @board[6]) && @board[4] == 'X'
			x_win.call
		when (@board[0] == @board[4]) && (@board[4] == @board[8]) && @board[4] == 'O'
			o_win.call
		when (@board[2] == @board[4]) && (@board[4] == @board[6]) && @board[4] == 'O'
			o_win.call
		when @board.none? {|el| el == nil }
			#draw
			@victory = true
			self.show_board
			puts "It's a Draw!"
		else
			return nil
		end
	end
end




bum = TicTacToe.new
bum.start_game