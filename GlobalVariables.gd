extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPM = 60.0
const BASIC_FALLING_BEATS = 8.0
const BASIC_FALLING_BPM = 120.0

const SINGLE_SQUARE = 64

var falling_speed_multiplier: float = 4.0
var BPM: float = 120.0
var difficulty: float = 2.0
var height: float = 400.0
var audio_delay = 100e-3


var BPS: float
var SPB: float
var falling_time: float
var judge_time: float
var falling_speed: float

var map_size = Vector2(10, 10)
var center: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	reload()
	pass # Replace with function body.

func reload():
	BPS = BPM / SPM
	SPB = 1 / BPS
	falling_time = BASIC_FALLING_BEATS / falling_speed_multiplier * (SPM / BASIC_FALLING_BPM)
	judge_time = SPB / difficulty
	falling_speed = height / falling_time
	center = Vector2(int(map_size[0]/2), int(map_size[1]/2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
