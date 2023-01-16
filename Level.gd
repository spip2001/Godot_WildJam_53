extends Node2D

onready var player = $"../Player"

var HUB = "HUB"
var FOREST = "FOREST"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func changeLevel(from, to):
	print(from)
	print(to)
	if to == FOREST:
		var nextLevel = load("res://Level/Forest/Forest.tscn").instance()
		self.remove_child(self.get_child(0))
		self.add_child(nextLevel)
		self.get_child(0).name = to
		
		player.position = self.get_child(0).get_node("Spawn" + from).position
		
