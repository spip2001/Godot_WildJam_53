extends KinematicBody2D

export(int) var DEFAULT_GRAVITY = 2000

onready var sprite = $Sprite


var gravity = DEFAULT_GRAVITY
var velocity: Vector2 = Vector2.ZERO
var direction:Vector2 = Vector2.ZERO
var jumping: bool = false




func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	sprite.flip_h = direction.x > 0
	
	velocity.x = direction.x * 250
	velocity.y = velocity.y + gravity * delta
	
	if not jumping and is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = -600
		gravity = 1000
		jumping = true
	if jumping and is_on_floor():
		jumping = false
		gravity = DEFAULT_GRAVITY
	
	velocity = move_and_slide(velocity , Vector2.UP)



