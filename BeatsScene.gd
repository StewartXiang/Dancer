extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var user: Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$BeatsTimer.start_as()
	pass # Replace with function body.


func create_beat():
	var beat = preload("res://Beat.tscn").instance()
	beat.init($BeatsTimer, user)
	$BeatsBar.add_child(beat)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
