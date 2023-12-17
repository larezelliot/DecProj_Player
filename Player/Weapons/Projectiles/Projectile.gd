extends Area2D

class_name Projectile


var attacker: Player #TODO Not only players can be owners
var damage: float = 0
var remaining_time_seconds: float = 100
var velocity: Vector2 = Vector2(10, 10)

func _initialize_projectile():
	pass


func _physics_process(delta):
	process_life(delta)
	process_movement(delta)


func process_life(delta):
	if remaining_time_seconds <= 0: queue_free()
	remaining_time_seconds -= delta


func process_movement(delta):
	transform.origin += (velocity * delta) 


func _on_body_entered(body: Node2D):
	if body is Player:
		pass
