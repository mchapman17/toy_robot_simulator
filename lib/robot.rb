class Robot

	attr_accessor :table, :position_x, :position_y, :facing

	DIRECTIONS = %w(NORTH EAST SOUTH WEST)

	def initialize(table)
		@table = table
	end

	def place(x,y)
		if table.x_position_valid?(x) &&  table.y_position_valid?(y)
			self.position_x = x.to_i
			self.position_y = y.to_i
		end
	end

	def placed?
		!position_x.nil? && !position_y.nil?
	end

	def position
		[position_x, position_y] if placed?
	end

	def face(direction)
		self.facing = direction if direction_valid?(direction)
	end

	def direction_valid?(direction)
		DIRECTIONS.include?(direction)
	end

	def move
		if placed? && facing?
			case facing
				when "NORTH"
					self.position_y += 1 if move_north_valid?
				when "EAST"
					self.position_x += 1 if move_east_valid?
				when "SOUTH"
					self.position_y -= 1 if move_south_valid?
				when "WEST"
					self.position_x -= 1 if move_west_valid?
			end
		end
	end

	def turn_left
		self.facing = DIRECTIONS.rotate(DIRECTIONS.index(self.facing) - 1).first if facing?
	end

	def turn_right
		self.facing = DIRECTIONS.rotate(DIRECTIONS.index(self.facing) + 1).first if facing?
	end

	def report
		"I am at position #{position_x},#{position_y} facing #{facing}" if placed? && facing?
	end


	private

		def facing?
			!facing.nil?
		end

		def move_north_valid?
			position_y < table.max_y_position
		end

		def move_east_valid?
			position_x < table.max_x_position
		end

		def move_south_valid?
			position_y > table.min_y_position
		end

		def move_west_valid?
			position_x > table.min_x_position
		end

end