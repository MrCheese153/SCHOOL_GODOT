extends CharacterBody2D


var direction: Vector2 = Vector2.ZERO
var speed: int = 200

func _physics_process(_delta: float):
	direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction * speed
	move_and_slide()
	animation()
	
	if Input.is_action_just_pressed("ui_accept"):
		print("somthing")
	
func animation():
	if direction:
		$AnimatedSprite2D.flip_h = direction.x > 0
		if direction.x != 0:
			$AnimatedSprite2D.animation = "Left"
		else:
			$AnimatedSprite2D.animation = "Up" if direction.y < 0 else "Down"
	else:
		$AnimatedSprite2D.frame = 0
		
