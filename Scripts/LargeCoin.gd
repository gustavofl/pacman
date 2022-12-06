extends Area2D


func _on_LargeCoin_area_entered(area):
	area.get_parent().collectLargeCoin()
	queue_free()
