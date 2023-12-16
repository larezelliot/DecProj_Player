extends Node

class_name Ability

var PLAYER : Player # Reference to the player
@export var COOLDOWN_SECONDS: float = 0	# Time to launch next ability

var seconds_in_cooldown: float = 0
var is_cooldown_ready: bool = true


# Constructor
func _init(player: Player, cooldown: float):
	name = "AbilityAbstract"
	PLAYER = player
	COOLDOWN_SECONDS = cooldown
	
# Update	
func _process(delta):
	process_cooldown(delta)


func process_cooldown(delta):
	if is_cooldown_ready:
		return
		
	seconds_in_cooldown += delta
	if seconds_in_cooldown >= COOLDOWN_SECONDS:
		is_cooldown_ready = true
		seconds_in_cooldown = 0.0


# Virtual method
# Try to activate the ability. Returns true if it was activated, false if it failed
func activate() -> bool:
	return false
