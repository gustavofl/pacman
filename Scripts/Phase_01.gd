extends Node2D


func _process(_delta):
	
	# ATUALIZAR HUD
	
	$HUD/Points.text = str($Player.points)

	$HUD.set_lifes(Global.PlayerLifes)
