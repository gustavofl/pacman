extends Node2D

var wall_collision_up = false
var wall_collision_down = false
var wall_collision_right = false
var wall_collision_left = false


func _on_area_collision_up_body_entered(_body):
	wall_collision_up = true

func _on_area_collision_up_body_exited(_body):
	wall_collision_up = false


func _on_area_collision_down_body_entered(_body):
	wall_collision_down = true

func _on_area_collision_down_body_exited(_body):
	wall_collision_down = false


func _on_area_collision_right_body_entered(_body):
	wall_collision_right = true

func _on_area_collision_right_body_exited(_body):
	wall_collision_right = false


func _on_area_collision_left_body_entered(_body):
	wall_collision_left = true

func _on_area_collision_left_body_exited(_body):
	wall_collision_left = false
