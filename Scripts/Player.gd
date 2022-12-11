extends KinematicBody2D

const STOPPED = 0
const MOVE_UP = 1
const MOVE_DOWN = 2
const MOVE_LEFT = 3
const MOVE_RIGHT = 4

var motion = Vector2.ZERO
var speed = 200
var move_direction = STOPPED
var old_position
var window_width = OS.get_window_size()[0]

onready var points = 0

func _ready():
	old_position = self.global_position
	
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
		$sprites.set_rotation_degrees(-90)
	elif move_direction == MOVE_DOWN:
		motion.y = speed
		$sprites.set_rotation_degrees(90)
	elif move_direction == MOVE_RIGHT:
		motion.x = speed
		$sprites.set_rotation_degrees(0)
	elif move_direction == MOVE_LEFT:
		motion.x = -speed
		$sprites.set_rotation_degrees(180)
	
	if self.global_position.x < 0:
		self.global_position.x = window_width + self.global_position.x
	if self.global_position.x > window_width:
		self.global_position.x = self.global_position.x - window_width
	
	var diff_x = abs(self.global_position.x - old_position.x)
	var diff_y = abs(self.global_position.y - old_position.y)
	
	if diff_x <= 0.01 and diff_y <= 0.01:
		$sprites.stop()
	else:
		$sprites.play("walk")
	old_position = self.global_position

	motion = move_and_slide(motion)


func collectSmallCoin():
	points += 10


func collectLargeCoin():
	points += 50


func die():
	print("morreu")
