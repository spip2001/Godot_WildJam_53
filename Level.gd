extends Node2D

onready var player = $"../Player"

var spawnName

var HUB = "HUB"
var FOREST = "FOREST"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func changeLevel(from, to):
	var nextLevel
	if to == FOREST:
		nextLevel = load("res://Level/Forest/Forest.tscn").instance()
	elif to == HUB:
		nextLevel = load("res://Level/Hub/Hub.tscn").instance()
		
	self.remove_child(self.get_child(0))
	self.add_child(nextLevel)
	self.get_child(0).name = to
	
	if to == HUB:
		spawnName = "Spawn" + from
		playerRespawn()
		
func playerRespawn():
	player.position = self.get_child(0).get_node(spawnName).position
		
