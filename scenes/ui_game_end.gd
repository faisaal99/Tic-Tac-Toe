extends Control

class_name UIGameEnd

onready var win_message = $"CenterContainer/VBoxContainer/WinMessage"

const _circle_win_text = "[center][color=red]CIRCLE[/color] WON THE GAME[/center]"
const _cross_win_text = "[center][color=yellow]CROSS[/color] WON THE GAME[/center]"
const _draw_text = "[center]DRAW[/center]"

var winner: String

func _init(w: String):
	winner = w
	print(w)

func _ready():
	print("ready called")
	if win_message == null:
		print("WinMEssage is null")
	else:
		print("It iqsn't null")
#	if winner == "circle":
#		win_message.bbcode_text = _circle_win_text
#	elif winner == "cross":
#		win_message.bbcode_text = _cross_win_text
#	else:
#		win_message.bbcode_text = _draw_text
