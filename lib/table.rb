class Table

	attr_accessor :min_x_position, :min_y_position, :max_x_position, :max_y_position
	
	def initialize(max_x_position = 4, max_y_position = 4)
		@min_x_position = 0
		@min_y_position = 0
		@max_x_position = max_x_position
		@max_y_position = max_y_position
	end


end