extends MarginContainer

enum SquareStatus { EMPTY, CIRCLE, CROSS }

# Child
onready var tex = $"tex" as TextureRect

# Props
signal button_pressed(whichButton)
export(int) var button_id = 0

# Texture
const cross = preload("res://assets/cross.tres")
const circle = preload("res://assets/circle.tres")

func _ready():
	pass

func _gui_input(event):
	if event.is_action_pressed("click"):
		change_status()
		emit_signal("button_pressed")

func change_status():
	var n = get_node("/root/CurrentPlayer").current
	
	if CurrentPlayer.current == CurrentPlayer.CurrentPlayer.CIRCLE:
		tex.texture = circle
		CurrentPlayer.current = CurrentPlayer.CurrentPlayer.CROSS
	else:
		tex.texture = cross
		CurrentPlayer.current = CurrentPlayer.CurrentPlayer.CIRCLE
