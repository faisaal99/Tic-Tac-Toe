extends Control

# Check all rows, columns and diagonals
# to determine if someone won
func check_if_winner() -> bool:
	var is_first_row = first_row_check()
	var is_second_row = second_row_check()
	var is_third_row = third_row_check()
	
	if is_first_row or is_second_row or is_second_row:
		return true
	return false

# Called when one of the players won
func player_won(which_player):
	var player = ""
	if which_player == Square.SquareStatus.CIRCLE:
		player = "Circle"
	else:
		player = "Cross"
	print("{player} won the game!".format({"player": player}))


func _on_button_pressed(which_button, btn: Square):
	var is_winner = check_if_winner()
	if is_winner:
		player_won(btn.fill_status)

func first_row_check() -> bool:
	var first_row: Array = [
		get_node("CenterContainer/GridContainer/square1") as Square,
		get_node("CenterContainer/GridContainer/square2") as Square,
		get_node("CenterContainer/GridContainer/square3") as Square
	]
	
	var circles = 0
	var crosses = 0
	
	for sq in first_row:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false

func second_row_check() -> bool:
	var first_row: Array = [
		get_node("CenterContainer/GridContainer/square4") as Square,
		get_node("CenterContainer/GridContainer/square5") as Square,
		get_node("CenterContainer/GridContainer/square6") as Square
	]
	
	var circles = 0
	var crosses = 0
	
	for sq in first_row:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false

func third_row_check() -> bool:
	var first_row: Array = [
		get_node("CenterContainer/GridContainer/square7") as Square,
		get_node("CenterContainer/GridContainer/square8") as Square,
		get_node("CenterContainer/GridContainer/square9") as Square
	]
	
	var circles = 0
	var crosses = 0
	
	for sq in first_row:
		if sq.fill_status == Square.SquareStatus.CIRCLE:
			circles += 1
		elif sq.fill_status == Square.SquareStatus.CROSS:
			crosses += 1
	
	if circles == 3 or crosses == 3:
		return true
	else:
		return false
