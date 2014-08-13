## Welcome to the Toy Robot Simulator!

This is a command-line program which simulates a robot moving on a table. The following commands are available:

* PLACE X,Y,(NORTH|EAST|SOUTH|WEST) - X and Y must be within table dimensions.
* MOVE - Moves the robot forward one square in the direction it's facing.
* LEFT - Turns the robot 90 degrees left.
* RIGHT - Turns the robot 90 degrees right.
* REPORT - Outputs the robot's current position on the table.
* CTRL+C - Exit.

### Rules & Assumptions

* Robot must be given a valid PLACE command before any others will work.
* The origin (0,0) of the table is in the south-west corner.
* Empty input will be ignored.
* Invalid commands or invalid arguments to PLACE will output a corresponding "Invalid" message.

### Extensibility

By having the Robot and Table as separate objects, a robot can be placed on different tables
and a table can have multiple robots. Give robots a Gun object and a #shoot method, and
this game can become Robot Wars!

### Limitations

Currently the robot is only able to move on a Table. A way to improve the design would be
to allow the robot to be placed on any type of object which has a grid layout.

### How To Run

* Fork this repository.
* Run `ruby toy_robot_simulator.rb` from within the \bin folder.

### How To Test

Run `bundle install` to get RSpec, and then `rspec spec` to run all tests.