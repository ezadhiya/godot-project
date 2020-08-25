extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 200
const gravity = 30
const jumpforce = -600

func _physics_process(delta):

	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.play("kodok_jalan")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite.play("kodok_jalan")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("kodok_diem")
		#velocity.x = 0
	
	velocity.y = velocity.y + 30
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			velocity.y = jumpforce
	else:
		$AnimatedSprite.play("kodok_lompat")
	
	velocity = move_and_slide(velocity,Vector2.UP)
	#pass
	velocity.x = lerp(velocity.x,0,0.3)
