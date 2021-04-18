extends Control
class_name PlayLogic

# All different combinations of solutions
# Rows
export(Array, NodePath) var first_row = []
export(Array, NodePath) var second_row = []
export(Array, NodePath) var third_row = []

# Columns
export(Array, NodePath) var first_column = []
export(Array, NodePath) var second_column = []
export(Array, NodePath) var third_column = []

# Diagonals
export(Array, NodePath) var forw_diagonal = []
export(Array, NodePath) var back_diagonal = []

# Props
var _circles = 0
var _crosses = 0

# Signals
signal signal_end_game(player)
signal switch_hud_player()

# Check all rows, columns and diagonals
# to determine if someone won
func check_if_winner() -> bool:
	var is_first_row = check_three(first_row)
	var is_second_row = check_three(second_row)
	var is_third_row = check_three(third_row)
	
	var is_first_col = check_three(first_column)
	var is_second_col = check_three(second_column)
	var is_third_col = check_three(third_column)
	
	var is_forw_dia = check_three(forw_diagonal)
	var is_back_dia = check_three(back_diagonal)
	
	if is_first_row or is_second_row or is_third_row \
	or is_first_col or is_second_col or is_third_col \
	or is_forw_dia or is_back_dia:
		return true
	
	return false

# Called when one of the players won
func player_won(which_player):
	var player = ""
	if which_player == Square.SquareStatus.CIRCLE:
		player = "circle"
	else:
		player = "cross"
	
	# Prevent other buttons from being pressed
	GameStatus.is_game_playing = false
	
	emit_signal("signal_end_game", player)

# Catches signal from a button press
func _on_button_pressed(btn: Square):
	var is_winner = check_if_winner()
	if is_winner:
		player_won(btn.fill_status)
	emit_signal("switch_hud_player")

# Clear all squares for new game
func clear_all():
	var btns = $"CenterContainer/GridContainer".get_children()
	for btn in btns:
		btn.reset_square()
	
	GameStatus.is_game_playing = true

# Goes through an array of 3 squares and checks
# if there are any three's
func check_three(squares: Array):
	var circles := 0
	var crosses := 0
	
	for sq in [get_node(squares[0]), get_node(squares[1]), get_node(squares[2])]:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	return false
