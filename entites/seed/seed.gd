extends Area2D

func _ready() -> void:
	$AnimatedSprite.play()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.addSeed()
		self.queue_free()
