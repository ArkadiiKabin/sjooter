extends CharacterBody2D


var MOVE_SPEED = 150
var hp=10
var target;
# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	pass
	
func hit(damage):
	if hp<=10 and hp!=0:
		hp-=damage
	else:
		queue_free()
	

