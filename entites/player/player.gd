extends CharacterBody2D

@export var SPEED: float = 200.0
@export var JUMP_FORCE: float = 400.0
@export var GRAVITY: float = 1000.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		if velocity.y > 1000:
			velocity.y = 1000
	else:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -JUMP_FORCE 

	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	if direction != 0:
		$AnimatedSprite.flip_h = direction >= 0
	move_and_slide()
