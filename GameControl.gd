extends Node
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var main_camera = $MainContainer/Viewport/Camera2D
# Called when the node enters the scene tree for the first time.
func _ready():
#	main_camera.custom_viewport = main_view
#	beats_camera.custom_viewport = beat_view
	
	main_camera.target = $MainContainer/Viewport/MainScene/User
	$BeatsContainer/Viewport/BeatsScene.user = $MainContainer/Viewport/MainScene/User
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	print(beats_camera.current)
#	pass
