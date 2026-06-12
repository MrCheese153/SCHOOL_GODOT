extends Node2D

@onready var run = $Run
@onready var dodge = $Dodge
@onready var gunny = $Gunny
@onready var select = $Select
@onready var label = $Label
@onready var timer = $Timer

func _ready() -> void:
	label.visible_characters = 0
	run.visible = false;dodge.visible = false;gunny.visible = false;select.visible = false;
	timer.one_shot = true
	


func text_shower():
	label.visible_characters = 0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.visible_characters += 1
	if timer.is_stopped():
		run.visible = true;dodge.visible = true;gunny.visible = true;select.visible = true;

	
	if Input.is_action_just_pressed("ui_right"):
		if select.position.x == 160:
			select.position.x = 430
		elif select.position.x == 430:
			select.position.x = 760
		else:select.position.x = 160
		text_shower()
		
	if Input.is_action_just_pressed("ui_left"):
		if select.position.x == 430:
			select.position.x = 160
		elif select.position.x == 760:
			select.position.x = 430
		else:select.position.x = 760
		text_shower()
			
	if select.visible:
		if select.position.x == 160:
			label.text = "Attack"
		if select.position.x == 430:
			label.text = "Dodge"
		if select.position.x == 760:
			label.text = "Run"
