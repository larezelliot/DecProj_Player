extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta):
	# Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	
	velocity = Vector2(horizontal_direction, vertical_direction).normalized() * SPEED;

	move_and_slide()
