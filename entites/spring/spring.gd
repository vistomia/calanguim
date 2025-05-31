extends StaticBody2D


func _on_area_jump_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.spring_jump()
