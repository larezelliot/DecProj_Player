extends Node2D

class_name PlayerAbility

var PLAYER : Player # Reference to the player that has the ability
var COOLDOWN_SECONDS = 0

var seconds_in_cooldown = 0
var is_cooldown_ready = true


func _init(player: Player, cooldown_seconds: float):
	self.PLAYER = player
	self.COOLDOWN_SECONDS = cooldown_seconds
	self.name = "AbilityAbstract"


func _process(delta):
	_process_cooldown(delta)


func _process_cooldown(delta):
	if is_cooldown_ready:
		return
	
	seconds_in_cooldown += delta
	if seconds_in_cooldown >= COOLDOWN_SECONDS:
		is_cooldown_ready = true
		seconds_in_cooldown = 0.0


func _is_ready() -> bool:
	return is_cooldown_ready


func use() -> bool:
	return false
