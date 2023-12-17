extends Weapon


class_name Bow

const ARROW_SCENE = preload("res://Player/Projectiles/Arrow/Arrow.tscn")
const LAUNCH_SPEED = 512
const LIFETIME_SECONDS = 2 


func initialize_bow(player: Player):
	var recharge_seconds: float = 1
	initialize_weapon(player, recharge_seconds)
	name = "Bow"

func _initialize_arrow() -> void:
	
	var arrow_instance : Projectile = ARROW_SCENE.instantiate()
	
	var mouse_position = get_global_mouse_position()
	var launch_origin = PLAYER.global_position
	var launch_direction = (mouse_position - PLAYER.global_position)
	var launch_velocity = launch_direction.normalized() * LAUNCH_SPEED
	
	arrow_instance.initialize_projectile(
		launch_origin,
		launch_velocity,
		LIFETIME_SECONDS)
	
	get_tree().get_root().add_child(arrow_instance, true)
	

func use() -> bool:
	if !_is_ready(): 
		return false
	
	is_recharge_ready = false
	_initialize_arrow()
	
	return true
