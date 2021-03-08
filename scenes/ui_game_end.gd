extends Control

class_name UIGameEnd

# Props
onready var win_message = $"CenterContainer/VBoxContainer/WinMessage" as RichTextLabel
const _circle_win_text = "[center][color=red]CIRCLE[/color] WON THE GAME[/center]"
const _cross_win_text = "[center][color=yellow]CROSS[/color] WON THE GAME[/center]"
const _draw_text = "[center]DRAW[/center]"

var winner: String

# Signal
signal on_replay_pressed

func _on_end_game(player):
	winner = player
	
	if winner == "circle":
		win_message.bbcode_text = _circle_win_text
	elif winner == "cross":
		win_message.bbcode_text = _cross_win_text
	else:
		win_message.bbcode_text = _draw_text
	
	visible = true

func _on_replay_pressed():
	emit_signal("on_replay_pressed")
