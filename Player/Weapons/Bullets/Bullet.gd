extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	constant_linear_velocity = Vector2(10,0.1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print_debug('position: ', transform.origin.x, ' : ', transform.origin.y)
	move_and_collide(constant_linear_velocity)
