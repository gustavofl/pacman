extends Control

var life_texture = load("res://Assets/Sprites/life.png")

func set_lifes(new_lifes):
	var current_lifes = $Life_Container.get_child_count()
	
	if current_lifes < new_lifes:
		var node = TextureRect.new()
		node.texture = life_texture
		
		$Life_Container.add_child(node)
		current_lifes = $Life_Container.get_child_count()
	
	if current_lifes > new_lifes and current_lifes > 0:
		$Life_Container.get_children()[-1].queue_free()
		
