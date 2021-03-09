extends Control

# Children
onready var txt = $"MarginContainer/VBoxContainer/CurrentPlayerText"\
	as RichTextLabel

# Constants
const _cross_playing_text = "[color=yellow]CROSS[/color]"
const _circle_playing_text = "[color=red]CIRCLE[/color]"
const _error_text = "[color=purple]ERROR![/color]"

# Props
export(String, "CROSS", "CIRCLE") var _current_player = "CIRCLE"

func _ready():
	_decide_text()

func _decide_text():
	if CurrentPlayer.current == CurrentPlayer.CurrentPlayer.CIRCLE:
		txt.bbcode_text = _circle_playing_text
	elif CurrentPlayer.current == CurrentPlayer.CurrentPlayer.CROSS:
		txt.bbcode_text = _cross_playing_text
	else:
		txt.bbcode_text = _error_text


func _on_switch_hud_player():
	_decide_text()
