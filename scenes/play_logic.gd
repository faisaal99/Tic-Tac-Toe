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

var _circles = 0
var _crosses = 0

var ui_game_end = preload("res://scenes/ui_game_end.tscn").instance()

# Check all rows, columns and diagonals
# to determine if someone won
func check_if_winner() -> bool:
	var is_first_row = first_row_check()
	var is_second_row = second_row_check()
	var is_third_row = third_row_check()
	
	var is_first_col = first_col_check()
	var is_second_col = second_col_check()
	var is_third_col = third_col_check()
	
	var is_forw_dia = forw_check()
	var is_back_dia = back_check()
	
	if is_first_row or is_second_row or is_third_row \
	or is_first_col or is_second_col or is_third_col \
	or is_forw_dia or is_back_dia:
		return true
	return false

# Called when one of the players won
func player_won(which_player):
	var player = ""
	if which_player == Square.SquareStatus.CIRCLE:
		player = "Circle"
	else:
		player = "Cross"
	
	# Prevent other buttons from being pressed
	GameStatus.is_game_playing = false
	add_child(ui_game_end)

# Catches signal from a button press
func _on_button_pressed(btn: Square):
	var is_winner = check_if_winner()
	if is_winner:
		player_won(btn.fill_status)

func first_row_check() -> bool:
	var fr: Array = [
		get_node(first_row[0]) as Square,
		get_node(first_row[1]) as Square,
		get_node(first_row[2]) as Square
	]
	
	var circles = 0
	var crosses = 0
	
	for sq in fr:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false
func second_row_check() -> bool:
	var sr: Array = [
		get_node(second_row[0]) as Square,
		get_node(second_row[1]) as Square,
		get_node(second_row[2]) as Square
	]
	
	var circles = 0
	var crosses = 0
	
	for sq in sr:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false
func third_row_check() -> bool:
	var tr: Array = [
		get_node(third_row[0]) as Square,
		get_node(third_row[1]) as Square,
		get_node(third_row[2]) as Square
	]
	
	var circles = 0
	var crosses = 0
	
	for sq in tr:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false

func first_col_check() -> bool:
	var circles = 0
	var crosses = 0
	
	for sq in [get_node(first_column[0]), get_node(first_column[1]), get_node(first_column[2])]:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false
func second_col_check() -> bool:
	var circles = 0
	var crosses = 0
	
	for sq in [get_node(second_column[0]), get_node(second_column[1]), get_node(second_column[2])]:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false
func third_col_check() -> bool:
	var circles = 0
	var crosses = 0
	
	for sq in [get_node(third_column[0]), get_node(third_column[1]), get_node(third_column[2])]:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false

func forw_check() -> bool:
	var circles = 0
	var crosses = 0
	
	for sq in [get_node(forw_diagonal[0]), get_node(forw_diagonal[1]), get_node(forw_diagonal[2])]:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false
func back_check() -> bool:
	var circles = 0
	var crosses = 0
	
	for sq in [get_node(back_diagonal[0]), get_node(back_diagonal[1]), get_node(back_diagonal[2])]:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false
