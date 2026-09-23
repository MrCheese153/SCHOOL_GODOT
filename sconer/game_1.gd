extends Node2D


var MousePos 

@onready var guy = $Click_Him 

func _ready() -> void:
	var Max = randi_range(500,-500)
	var Min = randi_range(250,-250)
	guy.position = Vector2(Min,Max)
	
	
func _process(delta: float) -> void:
	MousePos = get_viewport().get_mouse_position()
	
	
	

# Change this later to mouse entered true signal and mouse entered false signal to help with the sprite caughtme animation frames
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		print("oh no you clicked me off :3")

	
