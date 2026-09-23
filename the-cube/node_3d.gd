extends Node3D

@onready var box = $CSGBox3D
@onready var camera = $Camera3D
@onready var face = $CSGBox3D/Sprite3D
@onready var timer = $Timer

var cursor_location = Vector2i()
var blink
var will_blink = true
var happy = true
var sad = false
var time_done = false
var look_goal = Vector3(0,0,-1)
var look_goal_finder = .01
var goalX
var goalY 
var stupidfuckingYfixer = false 
var stupidfuckingXfixer = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	cursor_location = get_viewport().get_mouse_position()
	
	var ray_origin: Vector3 = camera.project_ray_origin(cursor_location)
	var ray_normal: Vector3 = camera.project_ray_normal(cursor_location)
	ray_normal.z = -1.0
	var randomI = randf_range(-1,1)
	var ray_length: float = 1200.0
	var ray_target: Vector3 = ray_origin + (ray_normal * ray_length)
	
	
	if happy:
		box.look_at(ray_target, Vector3.UP)
	if sad:
		goalX = look_goal.x * look_goal_finder
		goalY = look_goal.y * look_goal_finder
		
		if stupidfuckingYfixer and stupidfuckingXfixer:
			box.look_at(Vector3(goalX,goalY,-1))
		elif stupidfuckingYfixer:
			box.look_at(Vector3(-goalX,goalY,-1))
		elif stupidfuckingXfixer:
			box.look_at(Vector3(goalX,-goalY,-1))
		else:
			box.look_at(Vector3(-goalX,-goalY,-1))
		
		if look_goal_finder < 1:
			look_goal_finder += 0.1
		
		

	
	if time_done:
		if randomI >.5: stupidfuckingYfixer = true 
		else: stupidfuckingYfixer = false
		if randomI >.5: stupidfuckingXfixer = true
		else: stupidfuckingXfixer = false
		
			
		look_goal_finder = 0
		look_goal = Vector3(randomI,randomI,-1)
		timer.start()
		time_done = false
	blink = randi_range(1,1000)
	if will_blink:
		if happy:
			if blink <9:
				face.frame = 3
			if blink >9:
				face.frame = 0  
		if sad:
			if blink <15:
				face.frame = 2
			if blink >15:
				face.frame = 1
		
	if cursor_location.y > get_window().size.y or cursor_location.x > get_window().size.x or cursor_location.x < 0 or cursor_location.y < 0:
		happy = false
		sad = true
	else:
		sad = false
		happy = true
		
	
	if Input.is_action_pressed("Lclick"):
		will_blink = false
		face.frame = 5
	if Input.is_action_just_released("Lclick"):
		will_blink = true
		
	

	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	

func _on_timer_timeout() -> void:
	time_done = true
