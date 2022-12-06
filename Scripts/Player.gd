extends KinematicBody2D

const STOPPED = 0
const MOVE_UP = 1
const MOVE_DOWN = 2
const MOVE_LEFT = 3
const MOVE_RIGHT = 4


var motion = Vector2.ZERO
var speed = 160
var move_direction = STOPPED


func _process(_delta):
	
	if Input.is_action_pressed("ui_left") and $WallsCollisions.wall_collision_left == false:
		move_direction = MOVE_LEFT
	if Input.is_action_pressed("ui_right") and $WallsCollisions.wall_collision_right == false:
		move_direction = MOVE_RIGHT
	if Input.is_action_pressed("ui_up") and $WallsCollisions.wall_collision_up == false:
		move_direction = MOVE_UP
	if Input.is_action_pressed("ui_down") and $WallsCollisions.wall_collision_down == false:
		move_direction = MOVE_DOWN
	
	motion = Vector2.ZERO
	if move_direction == MOVE_UP:
		motion.y = -speed
	elif move_direction == MOVE_DOWN:
		motion.y = speed
	elif move_direction == MOVE_RIGHT:
		motion.x = speed
	elif move_direction == MOVE_LEFT:
		motion.x = -speed

	motion = move_and_slide(motion)
