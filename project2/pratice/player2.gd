extends CharacterBody2D

var activated = false

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Click"):
		if not activated:
			pass
	
