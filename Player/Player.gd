extends CharacterBody2D

class_name Player

@export var speed: float = 300.0
@export var abilities : Array = [];
@export var weapons : Array = [];

@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")


# Called when node and children has entered the scene tree 
func _ready():
	load_abilities()
	load_weapons()

# Called each physics frame with delta (time) as parameter
func _physics_process(delta):
	_manage_input()	
	_manage_animation()
	move_and_slide()


func load_abilities() -> void:
	#var run_ability = Ability.new(self)
	var dash_ability = AbilityDash.new(self)
	
	add_child(dash_ability, true)
	
	#abilities.append(run_ability);
	abilities.append(dash_ability);


func load_weapons() -> void:
	var tenis_gun = TenisGun.new(self)
	
	add_child(tenis_gun, true)
	
	weapons.append(tenis_gun);


func _manage_input() -> void:
	# Handle Ability.
	if Input.is_action_just_pressed("Ability_1"):
		abilities[0].activate();
		
	# Handle Weapons.
	if Input.is_action_just_pressed("ui_accept"):
		weapons[0].use(); 

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	velocity = Vector2(horizontal_direction, vertical_direction).normalized() * speed;
	
	
func _manage_animation() -> void:
	# Manage Animation Player
	if velocity.length() == 0:
		animation_player.play("Idle")  
		#print_debug('Idle')
	else:
		animation_player.play("Run")
		#print_debug('Running')
		
	# Manage Horizontal Orientation
	if velocity.x > 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true
