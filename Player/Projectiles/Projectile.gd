extends Area2D

class_name Projectile

#TODO: @export var attacker: Player
#TODO: @export var target_class: string
#TODO: @export var damage: float = 0
var velocity = Vector2(0, 0)
var remaining_time_seconds = 0

@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")


func initialize_projectile(
	initial_position: Vector2,
	initial_velocity: Vector2, 
	lifetime_seconds: float, ):
	
	position = initial_position
	velocity = initial_velocity
	remaining_time_seconds = lifetime_seconds


func _physics_process(delta):
	_process_life(delta)
	_process_sprite()
	_process_movement(delta)


func _process_life(delta):
	if remaining_time_seconds <= 0: queue_free()
	remaining_time_seconds -= delta


func _process_sprite():
	animated_sprite.look_at(position + velocity)


func _process_movement(delta):
	position += (velocity * delta) 


func _on_body_entered(body: Node2D):
	print(name, ' on_body_entered with ', body.name)
