class_name Ability

var player : Player # Reference to the player

# Called on initialization
func _init(player_ref: Player):
	player = player_ref


func activate():
	print_debug('ability used with speed: ', player.SPEED)
