extends CharacterBody2D

class_name Player

var speed = 300.0

var abilities = [];
var weapons = [];

@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")


func _ready():
	_load_abilities()
	_load_weapons()


func _physics_process(delta):
	_manage_input()	
	_manage_animation()
	move_and_slide()


func _load_abilities() -> void:
	for i in range(4):
		var dash_ability = AbilityDash.new(self)
		add_child(dash_ability, true)
		abilities.append(dash_ability);


func _load_weapons() -> void:
	var bow_scene = preload("res://Player/Weapons/Bow/Bow.tscn")
	var bow_node = bow_scene.instantiate()
	bow_node.initialize_bow(self)
	add_child(bow_node, true)
	weapons.append(bow_node);
	
	var sword_scene = preload("res://Player/Weapons/Sword/Sword.tscn")
	var sword_node = sword_scene.instantiate()
	sword_node.initialize_sword(self)
	add_child(sword_node, true)
	weapons.append(sword_node)

func _manage_input() -> void:
	_manage_input_abilities()
	_manage_input_weapons()
	_manage_input_movement()


func _manage_input_abilities() -> void:
	if Input.is_action_just_pressed("player_ability_1"):
		abilities[0].use();
	if Input.is_action_just_pressed("player_ability_2"):
		abilities[1].use();
	if Input.is_action_just_pressed("player_ability_3"):
		abilities[2].use();
	if Input.is_action_just_pressed("player_ability_4"):
		abilities[3].use();


func _manage_input_weapons() -> void:
	if Input.is_action_just_pressed("player_weapon_1"):
		weapons[0].use();
	if Input.is_action_just_pressed("player_weapon_2"):
		weapons[1].use();


func _manage_input_movement() -> void:
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
