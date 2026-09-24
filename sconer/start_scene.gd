extends Node2D
var loaded_game
var completion_check = false
var start_scene: PackedScene = preload("res://start_scene.tscn")
var game_1: PackedScene = preload("res://game_1.tscn")
var game_2: PackedScene = preload("res://game_2.tscn") 
@onready var READY = $ready_marker
@onready var Current_Game = $Current_Game
@onready var label = $Label
@onready var get_ready = $Get_Ready
@onready var go = $Go
@onready var backgroundcolor = $ColorRect
@onready var time_bar = $ProgressBar
func _ready() -> void:
	
	
	get_ready.start()
	pass
	
func _process(delta: float) -> void:
	time_bar.value = get_ready.time_left
	label.text = str(round(go.time_left))
	
	if time_bar.value != 0:
		if time_bar.value <= 2:
			READY.visible = true
			READY.modulate.a -= 0.5*delta
		if Current_Game.get_children() == []:
			pass
	
	
	if READY.modulate.a <= 0:
		pass

func _on_get_ready_timeout() -> void:
	loaded_game = game_1.instantiate() as Node2D
	Current_Game.add_child(loaded_game)
	go.start()
	
	
func _on_go_timeout() -> void:
	Current_Game.remove_child(loaded_game)
	get_ready.start()
	
	
	
