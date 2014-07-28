class Robot

	attr_accessor :table, :position_x, :position_y

	DIRECTIONS = %w(NORTH EAST SOUTH WEST)

	def initialize(table)
		@table = table
	end

	def place(x,y)
		self.position_x = x
		self.position_y = y
	end

	def placed?
		!position_x.nil? && !position_y.nil?
	end

	def face(direction)

	end

	def move

	end

	def turn_left

	end

	def turn_right

	end

	def report

	end

end