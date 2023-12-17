extends Node2D

class_name Weapon

var PLAYER : Player # Reference to the player that owns weapon
var RECHARGE_SECONDS: float = 0	

var seconds_in_recharge: float = 0
var is_recharge_ready: bool = true


func _init(player: Player, cooldown: float):
	PLAYER = player
	RECHARGE_SECONDS = cooldown
	name = "WeaponAbstract"


func _process(delta):
	_process_recharge(delta)


func _process_recharge(delta):
	if is_recharge_ready:
		return
		
	seconds_in_recharge += delta
	if seconds_in_recharge >= RECHARGE_SECONDS:
		is_recharge_ready = true
		seconds_in_recharge = 0.0


func use() -> bool:
	return false
