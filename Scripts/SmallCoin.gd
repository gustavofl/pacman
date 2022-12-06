extends Area2D


func _on_SmallCoin_area_entered(area):
	area.get_parent().collectSmallCoin()
	queue_free()
