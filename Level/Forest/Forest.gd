extends Node2D

onready var levelManager = $".."
onready var tileMap = $TileMap
onready var player = $"FroggerPlayer"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


func _on_HubTrigger_body_entered(body):
	if body.name == "FroggerPlayer":
		levelManager.changeLevel("FOREST", "HUB") # Replace with function body.


func _on_Water_body_entered(body):
	if body.name == "FroggerPlayer":
		player.setInWater(true)
