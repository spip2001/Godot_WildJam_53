extends KinematicBody2D

onready var sprite = $Sprite

var velocity: Vector2 = Vector2.ZERO
var direction:Vector2 = Vector2.ZERO
var maxSpeed = 250
var safe:bool = false
var safeOn: Node2D
var inWater: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()
	
	if direction.y != 0:
		sprite.flip_v = direction.y > 0 
	
	velocity = direction * maxSpeed
	if safeOn != null:
		velocity += safeOn.velocity * cos(deg2rad(safeOn.get_parent().rotation_degrees))
		
	velocity = move_and_slide(velocity)
	
func setSafe(area):
	safe = true
	safeOn = area
	
func setUnsafe(area):
	if safe and safeOn == area:
		safe = false
		safeOn = null
		
func setInWater(val:bool):
	if not safe:
		position = $"../SpawnHUB".position
