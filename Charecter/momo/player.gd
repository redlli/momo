extends CharacterBody2D

const SPEED = 300.0
var up=false
var down=false

func _physics_process(delta):
	$Sprite2D/AnimatedSprite2D.play("Speed")
	if up==true :
		self.position.y -= SPEED * get_process_delta_time()

	elif down==true:
		self.position.y += SPEED * get_process_delta_time()

func _input(event):
	if event.is_action_pressed("ui_up"):
		down=false
		up=true
	elif event.is_action_pressed("ui_down"):
		up=false
		down=true

func _on_down_button_down():
	up=false
	down=true

func _on_up_button_down():
	down=false
	up=true
	
