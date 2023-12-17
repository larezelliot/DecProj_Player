extends Node

class_name Weapon

var PLAYER : Player # Reference to the player that owns weapon
var RECHARGE_SECONDS: float = 0	# Time to launch next ability

var seconds_in_recharge: float = 0
var is_recharge_ready: bool = true


# Constructor
func _init(player: Player, cooldown: float):
	name = "WeaponAbstract"
	PLAYER = player
	RECHARGE_SECONDS = cooldown


# Update	
func _process(delta):
	process_recharge(delta)


# Updates recharge
func process_recharge(delta):
	if is_recharge_ready:
		return
		
	seconds_in_recharge += delta
	if seconds_in_recharge >= RECHARGE_SECONDS:
		is_recharge_ready = true
		seconds_in_recharge = 0.0


# Virtual method
# Try to use the weapon. Returns true if it was used, false if it failed
func use() -> bool:
	return false
