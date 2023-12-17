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
	print_debug('Tenis Gun used')
	
	return true
