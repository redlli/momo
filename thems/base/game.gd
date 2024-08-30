extends Node2D

@onready var block = preload("res://thems/base/block.tscn")
@onready var coin = preload("res://thems/base/coin.tscn")
var coin1
var coin2
var b1
var b2
var colide=false
var score=0
func _ready():
	coin1=coin.instantiate()
	coin1.position = Vector2(1200, randf_range(40, 600))
	add_child(coin1)
	coin2=coin.instantiate()
	coin2.position = Vector2(1205, randf_range(40, 600))
	add_child(coin2)
	#----------------------------------------
	b1=block.instantiate()
	b1.position = Vector2(1200, randf_range(80, 580))
	add_child(b1)
	#b2=block.instantiate()
	#b2.position = Vector2(1200, randf_range(40, 580))
	#add_child(b2)
	$Background/BGM.play()

func _process(delta):
	#MOVING BACKGROUND
	$Score.text=str(score)
	$G0.translate(Vector2(-500 * delta, 0))
	$G1.translate(Vector2(-500 * delta, 0))
	if $G0.position.x <= -1137:
		$G0.position.x = 2872
	if $G1.position.x <= -1240:
		$G1.position.x = 2754
	#---------------------------------------	
	#coin moving and adding score 	
	coin1.translate(Vector2(-500 * delta, 0))
	coin2.translate(Vector2(-500 * delta, 0))
	if coin1.position.x <= -2400 or colide==true:
		coin1.position= Vector2(1200, randf_range(40, 600))
		colide=false
	if coin2.position.x <= -2400 or colide==true:
		coin2.position = Vector2(1200, randf_range(40, 600))
		colide=false
	#-----------------------------------------
	#block moving and adding score 	
	b1.translate(Vector2(-500 * delta, 0))
	#b2.translate(Vector2(-500 * delta, 0))
	if b1.position.x <= -2400:
		b1.position=Vector2(1200, randf_range(345, 645))
	#if b2.position.x <= -2400:
		#b2.position= Vector2(1200, randf_range(40, 600))
		
func _on_momo_colid(area):
	if area.is_in_group("coin"):
		print("coin baby")
		colide=true
		score+=1
	if area.is_in_group("block"):
		get_tree().change_scene_to_file("res://ui/start.tscn")
