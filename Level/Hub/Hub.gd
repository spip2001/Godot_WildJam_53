extends Node2D


onready var levelManager = $".."



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ForestTrigger_body_entered(body):
	if body.name == "Player":
		levelManager.changeLevel("HUB", "FOREST")
	
