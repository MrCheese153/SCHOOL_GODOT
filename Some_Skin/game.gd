extends Node2D

@onready var particles = $PandT/CPUParticles2D
@onready var black_transitor = $The_Black_Transitor

var flake1: Texture2D = preload("res://flakes1.png")
var flake2: Texture2D = preload("res://flakes2.png") 

var flake_choice = ""
var loading = false
var lighten = false
var darken = false
var luck





	
func _process(delta: float) -> void:
	#black transitor
	if Input.is_action_just_pressed("ui_accept"):
		darken = true;loading = true
	if loading:
		if darken:black_transitor.modulate.a += 10 * delta
		if black_transitor.modulate.a > 1: lighten = true; darken = false
		if lighten:black_transitor.modulate.a -= 10 * delta
		if black_transitor.modulate.a < 0: loading = false; lighten = false
	luck = randi_range(1,10)

func flake_maker():
	if luck >= 5:
		particles.set_texture(flake1)
	else:
		particles.set_texture(flake2)


func _on_timer_timeout() -> void:
	particles.position.y = randi_range(22.5,625.5)
	
	flake_maker()
	if luck >= 4:
		particles.direction.x = 1
		particles.position.x = 0
		particles.color.a8 -= 1
		
	else:
		particles.direction.x = -1
		particles.position.x = 1200
		particles.color.a8 += 10
		
