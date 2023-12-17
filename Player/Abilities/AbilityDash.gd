extends PlayerAbility

class_name AbilityDash

var EXTRA_SPEED = 1000
var DURATION_SECONDS = 0.1;


func _init(player: Player):
	var cooldown_seconds = 5
	super(player, cooldown_seconds)
	
	name = "AbilityDash"


func _dash():
	PLAYER.speed = PLAYER.speed + EXTRA_SPEED
	await PLAYER.get_tree().create_timer(DURATION_SECONDS).timeout
	PLAYER.speed = PLAYER.speed - EXTRA_SPEED


func use() -> bool:
	if !_is_ready(): return false;
	
	is_cooldown_ready = false
	
	_dash()
	return true
