extends Node2D

@onready var block = preload("res://thems/base/block.tscn")
@onready var coin = preload("res://thems/base/coin.tscn")
@onready var dik = preload("res://thems/base/dik.tscn")
var coin1
var coin2
var b1
var b2
var colide=false
var score=0
var dikrun=false
var hiscore=0
var file
func _ready():
	
	#var file = JSON.new()
	file = FileAccess.open("user://database.txt", FileAccess.READ)
	if file:
		hiscore = int(file.get_as_text())
		file.close()
	$HiScore.text = "GSOAT: " + str(hiscore)
	
	coin1=coin.instantiate()
	coin1.position = Vector2(1150, randf_range(40, 600))
	add_child(coin1)
	coin2=coin.instantiate()
	coin2.position = Vector2(1205, randf_range(40, 600))
	add_child(coin2)
	#----------------------------------------
	b1=block.instantiate()
	b1.position = Vector2(1190, randf_range(80, 580))
	add_child(b1)
	#-----------------------------------------
	b2=dik.instantiate()
	b2.position = Vector2(1250, randf_range(40, 580))
	add_child(b2)
	$Background/BGM.play()

func _process(delta):
	#MOVING BACKGROUND
	
	var x=randi_range(0,100)
	if x==2:
		dikrun=true
	$Score.text=str(score)
	if score>int(hiscore):
		hiscore=score
		$HiScore.text="GSOAT: "+str(hiscore)
	$G0.translate(Vector2(-500 * delta, 0))
	$G1.translate(Vector2(-500 * delta, 0))
	if $G0.position.x <= -1137:
		$G0.position.x = 2880
		$G0.position.y=504
	if $G1.position.x <= -1137:
		$G1.position.x = 2880
	#---------------------------------------	
	#coin moving and adding score 	
	coin1.translate(Vector2(-500 * delta, 0))
	coin2.translate(Vector2(-500 * delta, 0))
	if coin1.position.x <= -2400 or colide==true:
		coin1.position= Vector2(randf_range(1150,1200), randf_range(40, 600))
		colide=false
	if coin2.position.x <= -2400 or colide==true:
		coin2.position = Vector2(randf_range(1150,1200), randf_range(40, 600))
		colide=false
	#-----------------------------------------
	#block moving and adding score 	
	b1.translate(Vector2(-500 * delta, 0))
	if b1.position.x <= -2400:
		b1.position=Vector2(randf_range(1150,1200), randf_range(345, 645))
	#---------------Dick moving
	if dikrun==true:
		b2.translate(Vector2(-300 * delta, 0))
		if b2.position.x <= -270:
			b2.position= Vector2(randf_range(1290,1300), randf_range(40, 600))
			dikrun=false

func _on_momo_colid(area):
	if area.is_in_group("coin"):
		print("coin baby")
		colide=true
		score+=1
		$reard.play()
	if area.is_in_group("block"):
		file = FileAccess.open("user://database.txt", FileAccess.WRITE)
		file.store_string(str(hiscore))
		file.close()
		$dead.play() 
		get_tree().paused=true
		$KO.visible=true
		
func _on_start_button_down():
	get_tree().paused=false
	get_tree().reload_current_scene()
