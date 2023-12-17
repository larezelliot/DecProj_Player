extends Weapon


class_name TenisGun


# Constructor
func _init(player: Player):
	name = "TenisGun"
	var recharge: float = 5
	super(player, recharge)


# Override method
func use() -> bool:
	if !is_recharge_ready: return false;
	
	is_recharge_ready = false
	var x = preload("res://Player/Weapons/Bullets/Bullet.tscn").instantiate()
	add_child(x)
	return true
