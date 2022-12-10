extends StaticBody2D

export(String, "Red", "Blue", "Pink", "Yellow") var color

onready var SpritesFrames = $Sprites.frames

func _ready():
	var res_sprites = load("res://Assets/Sprite_Frames/Sprites_Ghost_"+color+".tres")
	
	$Sprites.set_sprite_frames(res_sprites)

func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		$Sprites.set_animation("walk_right")
	if Input.is_action_pressed("ui_right"):
		$Sprites.set_animation("walk_left")
	if Input.is_action_pressed("ui_up"):
		$Sprites.set_animation("walk_up")
	if Input.is_action_pressed("ui_down"):
		$Sprites.set_animation("walk_down")
