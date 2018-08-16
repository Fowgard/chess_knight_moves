# odstranovat z board array pri nalezeni tahu, pri vytvareni grafu rovnou i prohledavat


class Board
	attr_accessor :board

	def initialize
		@board = []

		8.times do |i|
			8.times do |j|
				@board << [i,j]
			end
		end
		#puts @board.to_s
	end

	
end



class Vertex
	attr_accessor :current_position, :parent, :possible_moves, :board
	
	def initialize
		@current_position = []
		@possible_moves = []
		@board = Board.new

	end

	def print_out_path(finish)
		path = [finish]

		if self.parent != nil
			tmp = self.parent	

			while !tmp.parent.nil? do 
				path << tmp
				tmp = tmp.parent
			end
		end

		exit
	end

	def knight_moves(start, finish)
		#first_vertex = Vertex.new
		#first_vertex.current_position = start
		@current_position = start
		@possible_moves.push(self)

		while @possible_moves.any? do 
			
			if @current_position == finish
				print_out_path(finish)
			end

			find_moves()


			@possible_moves.shift()
			@current_position = @possible_moves[0].current_position
			puts @possible_moves[0].parent.current_position.to_s
		end


		
	end

	def find_moves
		legal_moves = find_possible_moves()
		legal_moves.each do |move|
			new_vertex = Vertex.new
			new_vertex.parent = self
			new_vertex.current_position = move
			@possible_moves.push(new_vertex)


		end
	end

	def find_possible_moves
		legal_moves = []
		new_move = [@current_position[0] + 1, @current_position[1] + 2]
		legal_moves << new_move if @board.board.include?(new_move)

		new_move = [@current_position[0] + 2, @current_position[1] + 1]
		legal_moves << new_move if @board.board.include?(new_move)

		new_move = [@current_position[0] + 2, @current_position[1] - 1]
		legal_moves << new_move if @board.board.include?(new_move)

		new_move = [@current_position[0] + 1, @current_position[1] - 2]
		legal_moves << new_move if @board.board.include?(new_move)

		new_move = [@current_position[0] - 2, @current_position[1] - 1]
		legal_moves << new_move if @board.board.include?(new_move)

		new_move = [@current_position[0] - 1, @current_position[1] - 2]
		legal_moves << new_move if @board.board.include?(new_move)

		new_move = [@current_position[0] - 2, @current_position[1] + 1]
		legal_moves << new_move if @board.board.include?(new_move)

		new_move = [@current_position[0] + 2, @current_position[1] - 1]
		legal_moves << new_move if @board.board.include?(new_move)

		return legal_moves
	end
end



vertex = Vertex.new
vertex.knight_moves([3,3], [0,0])

