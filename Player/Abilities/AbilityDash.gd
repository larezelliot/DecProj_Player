extends Ability

class_name AbilityDash

@export var EXTRA_SPEED: float = 1000


# Override method
func activate() -> void:
	print_debug('Dash activated')
	
	player.SPEED = player.SPEED + EXTRA_SPEED
	await player.get_tree().create_timer(0.1).timeout
	player.SPEED = player.SPEED - EXTRA_SPEED
