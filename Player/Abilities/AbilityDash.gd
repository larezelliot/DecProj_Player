extends Ability

class_name AbilityDash

var EXTRA_SPEED: float = 1000
var DURATION_SECONDS: float = 0.1;


# Constructor
func _init(player: Player):
	name = "AbilityDash"
	var cooldown: float = 5
	super(player, cooldown)



# Override method
func activate() -> bool:
	if !is_cooldown_ready: return false;
	
	is_cooldown_ready = false
	
	PLAYER.speed = PLAYER.speed + EXTRA_SPEED
	await PLAYER.get_tree().create_timer(DURATION_SECONDS).timeout
	PLAYER.speed = PLAYER.speed - EXTRA_SPEED
	
	return true
