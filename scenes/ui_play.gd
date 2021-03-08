extends Control

class_name UIGameEnd

var play_status = GameStatus.is_game_playing
signal play_enabled

func _ready():
	play_status = false

func _on_play_pressed():
	play_status = true
	_init_new_game()

func _init_new_game():
	emit_signal("play_enabled")


func _animation_finished(anim_name):
	self.queue_free()
