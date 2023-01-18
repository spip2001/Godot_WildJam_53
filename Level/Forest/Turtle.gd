extends Node2D


var speed = 80
var velocity;


func _ready():
	velocity = Vector2(speed, 0)
	pass # Replace with function body.

func _process(delta):
	position += delta * velocity


func _on_Turtle_body_entered(body):
	if body.name == "FroggerPlayer":
		body.setSafe(self)


func _on_Turtle_body_exited(body):
	if body.name == "FroggerPlayer":
		body.setUnsafe(self) # Replace with function body.
