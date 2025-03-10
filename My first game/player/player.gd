extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = $AnimatedSprite2D
var heals =100
var gold = 0



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play('jump')

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y==0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y==0:
			anim.play("idle")
	if direction==-1:
		$AnimatedSprite2D.flip_h=true
		
	elif direction ==1:
		$AnimatedSprite2D.flip_h=false
	
	if velocity.y>0:
		anim.play("fall")
	
	if heals <= 0:
		queue_free()
		
		get_tree().change_scene_to_file("res://menu.tscn")
	move_and_slide()
