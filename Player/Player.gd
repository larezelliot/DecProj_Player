extends CharacterBody2D

const SPEED = 300.0

@onready var animated_sprite = get_node("AnimatedSprite2D")
@onready var animation_player = get_node("AnimationPlayer")


func _physics_process(delta):
	_manage_input()	
	_manage_animation()
	move_and_slide()
	
	
func _manage_input():
	# Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	velocity = Vector2(horizontal_direction, vertical_direction).normalized() * SPEED;
	
	
func _manage_animation():
	# Manage Animation Player
	if velocity.length() == 0:
		animation_player.play("Idle")  
		print_debug('Idle')
	else:
		animation_player.play("Run")
		print_debug('Running')
		
	# Manage Horizontal Orientation
	if velocity.x > 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true
