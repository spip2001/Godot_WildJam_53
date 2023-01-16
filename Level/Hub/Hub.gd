extends Node2D


onready var levelManager = $".."



# Called when the node enters the scene tree for the first time.
func _ready():
	print("HUB OK")
	pass # Replace with function body.




func _on_ForestTrigger_body_entered(body):
	print(body.name)
	if body.name == "Player":
		levelManager.changeLevel("HUB", "FOREST")
	