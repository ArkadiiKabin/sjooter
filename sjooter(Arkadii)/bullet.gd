extends CharacterBody2D

var papa = null
var speed = 200
# Get the gravity from the project settings to be synced with RigidBody nodes.")


func _ready():
	velocity = Vector2(0,-speed)
	
func _physics_process(delta):
	$AnimatedSprite2D.play("run")
	move_and_collide(velocity*delta)
	
	var coll=move_and_collide(velocity*delta)
	if coll:
		if coll.get_collider().has_method("hit"):
			coll.get_collider().hit(1)
		queue_free()

	

