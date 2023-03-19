extends CharacterBody2D

const bullet = preload("res://enemy.tscn")

var speed = 200
var timer=0.5
var target;

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		$AnimatedSprite2D.flip_h=false
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		$AnimatedSprite2D.flip_h=true
	if Input.is_action_pressed("down"):
		velocity.y += 1
		$AnimatedSprite2D.flip_v=true
	if Input.is_action_pressed("up"):
		$AnimatedSprite2D.flip_v=false
		velocity.y -= 1
	if Input.is_action_pressed("ui_accept"):
		shoot()
	velocity = velocity.normalized() * speed
func shoot():
	if timer < 0:
		timer = 0.5
		var b = bullet.instantiate()
		get_parent().add_child(b)
		b.position.x=position.x
		b.position.y=position.y - 30

func _physics_process(delta):
	$AnimatedSprite2D.play("fly")
	get_input()
	timer-= delta
	move_and_collide(velocity*delta)
