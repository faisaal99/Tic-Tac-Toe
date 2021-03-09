extends Control

# Children
onready var txt = $"VBoxContainer/CurrentPlayerText"\
	as RichTextLabel

# Constants
const cross_playing_text = "[color=yellow]CROSS[/color]"
const circle_playing_text = "[color=red]CIRCLE[/color]"

# Props
export(String, "CROSS", "CIRCLE") var current_player
