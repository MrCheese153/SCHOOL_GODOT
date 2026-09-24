extends Node2D

@onready var ground = $Ground
@onready var evil_container = $Evil_Container
@onready var evil_thing = $Evil_Container/Evil_Thing
@onready var jump_thing = $Jump_Thing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	evil_thing.position.x += 150*delta
	pass
