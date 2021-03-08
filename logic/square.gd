extends MarginContainer

class_name Square

enum SquareStatus { EMPTY, CIRCLE, CROSS }

# Child
onready var tex = $"tex" as TextureRect

# Props
signal button_pressed(btn)
export(int) var button_id = 0
var fill_status = SquareStatus.EMPTY

# Texture
const cross = preload("res://assets/cross.tres")
const circle = preload("res://assets/circle.tres")

func _ready():
	pass

func _gui_input(event):
	if event.is_action_pressed("click") and GameStatus.is_game_playing:
		var should_emit = change_status()
		
		if should_emit:
			emit_signal("button_pressed", self)

func reset_square():
	fill_status = SquareStatus.EMPTY
	tex.texture = null

# Return true if it does change
# Return false if it doesn't change
func change_status() -> bool:
	if fill_status != SquareStatus.EMPTY:
		return false
	
	if CurrentPlayer.current == CurrentPlayer.CurrentPlayer.CIRCLE:
		tex.texture = circle
		fill_status = SquareStatus.CIRCLE
		
		CurrentPlayer.current = CurrentPlayer.CurrentPlayer.CROSS
	else:
		tex.texture = cross
		fill_status = SquareStatus.CROSS
		
		CurrentPlayer.current = CurrentPlayer.CurrentPlayer.CIRCLE
	
	return true
