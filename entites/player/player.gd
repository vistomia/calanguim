extends CharacterBody2D

@export var SPEED: float = 200.0
@export var JUMP_FORCE: float = 300.0
@export var GRAVITY: float = 1000.0

var seeds: int = 90
var spring = preload("res://entites/sample/Sample.tscn")

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

	if Input.is_action_just_pressed("ui_down"):
		plantSeed()

	if direction != 0:
		$AnimatedSprite.flip_h = direction >= 0
	move_and_slide()

func plantSeed() -> void:
	if is_plant_allowed():
		seeds -= 1
		var spring = spring.instantiate()
		spring.position = global_position
		get_parent().add_child(spring)

func addSeed() -> void:
	seeds += 1

func is_plant_allowed() -> bool:
	return is_on_floor() and seeds > 0

func spring_jump() -> void:
	velocity.y += -JUMP_FORCE * 1.5
