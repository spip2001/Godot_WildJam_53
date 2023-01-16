extends KinematicBody2D

export(int) var DEFAULT_GRAVITY = 2000

onready var sprite = $Sprite


var gravity = DEFAULT_GRAVITY
var jumpForce = -600
var velocity: Vector2 = Vector2.ZERO
var direction:Vector2 = Vector2.ZERO
var jumping: bool = false
var maxSpeed = 250




func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if direction.x != 0:
		sprite.flip_h = direction.x > 0
	
	velocity.x = direction.x * maxSpeed
	velocity.y = velocity.y + gravity * delta
	
	if not jumping and is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jumpForce
		gravity = DEFAULT_GRAVITY / 2
		jumping = true
	if jumping and is_on_floor():
		jumping = false
		gravity = DEFAULT_GRAVITY
	
	velocity = move_and_slide(velocity , Vector2.UP)



