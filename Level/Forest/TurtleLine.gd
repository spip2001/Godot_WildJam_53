extends Node2D

export(int) var direction = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_EndOfLine_area_entered(area):
	area.position = Vector2.ZERO
	 # Replace with function body.
