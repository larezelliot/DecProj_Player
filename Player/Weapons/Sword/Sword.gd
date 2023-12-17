extends Weapon

class_name Sword

@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")


func initialize_sword(player: Player):
	var recharge_seconds: float = 1
	initialize_weapon(player, recharge_seconds)
	name = "Sword"


func _initialize_sword_damage() -> void:
	pass


func use() -> bool:
	if !_is_ready(): 
		return false
	
	is_recharge_ready = false
	animated_sprite.frame += 1
	_initialize_sword_damage()
	
	return true
