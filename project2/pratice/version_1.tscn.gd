extends Node2D
var first_click = false
var secont_click = false
var all_other_clicks = false
var Text_Corrector: Vector2
var Mouse: Vector2 
var Infinitely_Bigger = false
var BIGGER = 1.05
var Blactivator = Vector2(100, 0)
var Un_Whiteinator = Color(randf(),randf(),randf())
func _ready() -> void:
	$"HELLO_THERE".modulate.a = 0.0
	

func _process(delta: float) -> void:
	
	if Infinitely_Bigger:
		$Sprite2D.global_scale *= BIGGER
		$"HELLO_THERE".modulate.a += 0.5 * delta
		if $Sprite2D.global_scale >= Blactivator:
			$White.modulate = Un_Whiteinator
			$Sprite2D.modulate -= 0.001*Un_Whiteinator
			
			
	Text_Corrector.x = $"HELLO_THERE".size.x / -2.0
	Mouse = get_global_mouse_position()
	$Sprite2D.position = Mouse
	$"HELLO_THERE".position = Mouse + Text_Corrector
	if Input.is_action_just_pressed("Click"):
		if not first_click and not all_other_clicks and not secont_click:
			$"HELLO_THERE".visible = not $"HELLO_THERE".visible
			first_click = true
			$Timer.start()
		if first_click:
			if $Timer.is_stopped():
				secont_click = true
				$"HELLO_THERE".text = "You can click again if you want"
		if secont_click:
			if $Timer.is_stopped():
				$"HELLO_THERE".text = ["Clicked again I guess...",
				"Clickity click clicked",
				"The Colors are changing"
				].pick_random()
		Un_Whiteinator = Color(randf(),randf(),randf())
		$AnimationPlayer.stop()
		Infinitely_Bigger = true
		print("clicked")
		print (Mouse)

	
