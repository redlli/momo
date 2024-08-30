extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background/BGM.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	print("game started")
	get_tree().change_scene_to_file("res://ui/game.tscn")



func _on_button_pressed():
	$Background/BGM.stop()
