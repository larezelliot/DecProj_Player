class_name Ability

var player : Player # Reference to the player

# Called on initialization
func _init(player_ref: Player):
	player = player_ref


# Virtual method
func activate() -> void:
	print_debug('Ability activated')
	pass
