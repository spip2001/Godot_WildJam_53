extends Area2D


var speed = 100
var velocity;


func _ready():
	velocity = Vector2(speed, 0)
	pass # Replace with function body.

func _process(delta):
	position += delta * velocity
