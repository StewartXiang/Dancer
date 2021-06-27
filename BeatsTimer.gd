extends Timer

var current_beat = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = GlobalVariables.SPM / GlobalVariables.BPM
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BeatsTimer_timeout():
	current_beat += 1

func start_as(init_beat=0):
	current_beat = init_beat
	start()
	yield(get_tree().create_timer(GlobalVariables.falling_time - GlobalVariables.audio_delay), "timeout")
	$"../AudioStreamPlayer".play()
	
func reset():
	stop()
	current_beat = 0
