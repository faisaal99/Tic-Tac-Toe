extends AnimationPlayer


func _on_UI_Play_play_enabled():
	self.current_animation = "fade_menu"


func _on_replay_pressed():
	current_animation = "fade_replay_menu"
