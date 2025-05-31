extends Area2D
class_name Sample

@export var seed_grow_time: float = 1
@export var sample_grow_time: float = 0.5
@export var plant: PackedScene

func _ready() -> void:
	$TimeGrow.wait_time = seed_grow_time
	$TimeSample.wait_time = sample_grow_time
	$TimeGrow.start()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$TimeGrow.paused = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		$TimeGrow.start(seed_grow_time)
		$TimeGrow.paused = false


func _on_time_grow_timeout() -> void:
	$HitBoxSample/Collision.disabled = false
	$TimeSample.start()

func _on_time_sample_timeout() -> void:
	var a = preload("res://entites/spring/Spring.tscn").instantiate()
	var plant_instance = plant.instantiate()
	get_parent().add_child(plant_instance)
	plant_instance.global_position = self.global_position
	self.queue_free()
