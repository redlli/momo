extends Node2D;
@onready var coin=preload("res://thems/base/coin.tscn")
@onready var block=preload("res://thems/base/block.tscn")


func  _ready():
	$Background/BGM.play()

func _process(delta):
	spawn_blocks()
	spawn_coins()
	

func spawn_coins():
	var point = coin.instantiate()
	point.position = Vector2(randf_range(700, 800), randf_range(0, 600))
	add_child(point)
	 

func spawn_blocks():
	var obti = block.instantiate()
	obti.position = Vector2(randf_range(800, 800), randf_range(0, 600))
	add_child(obti)
