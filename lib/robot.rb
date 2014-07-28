class Robot

	attr_accessor :table, :position_x, :position_y, :facing

	DIRECTIONS = %w(NORTH EAST SOUTH WEST)

	def initialize(table)
		@table = table
	end

	def place(x,y)
		self.position_x = x if valid_x_position?(x)
		self.position_y = y if valid_y_position?(y)
	end

	def placed?
		!position_x.nil? && !position_y.nil?
	end

	def face(direction)
		self.facing = direction if valid_direction?(direction)
	end

	def move

	end

	def turn_left
		self.facing = DIRECTIONS.rotate(-1).first
	end

	def turn_right

	end

	def report
		"I am at #{position_x},#{position_y} - facing #{facing}" if placed? && facing?
	end


	private

		def facing?
			!facing.nil?
		end

		def valid_x_position?(x)
			x.to_i.between?(table.min_x_position, table.max_x_position)
		end

		def valid_y_position?(y)
			y.to_i.between?(table.min_y_position, table.max_y_position)
		end

		def valid_direction?(direction)
			DIRECTIONS.include?(direction)
		end

end