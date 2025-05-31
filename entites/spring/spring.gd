extends StaticBody2D

var is_extend = false

func _on_area_jump_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !is_extend:
		body.spring_jump()
		is_extend = true
		$Reload.start()

func _on_reload_timeout() -> void:
	is_extend = false
