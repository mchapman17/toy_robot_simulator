## Welcome to the Toy Robot Simulator!

This is a command-line program which simulates a robot moving on a table. The following commands are available:

* PLACE X,Y,(NORTH|EAST|SOUTH|WEST) - X and Y must be within table dimensions
* MOVE - Moves the robot forward one square in the direction it's facing
* LEFT - Turns the robot 90 degress left
* RIGHT - Turns the robot 90 degress right
* REPORT - Outputs the robot's current position on the table

### Rules & Assumptions

* Robot must be given a valid PLACE command before any others will work
* The origin (0,0) of the table is in the south-west corner
* Empty input will be ignored
* Invalid commands or invalid arguments to PLACE will output a corresponding "Invalid" message

### How To Run

Run `ruby toy_robot_simulator.rb` from within the \bin folder


### How To Test

Run `bundle install` to get RSpec, and then `rspec spec` to run all tests