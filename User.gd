extends Area2D

const UP = 0b1000
const DOWN = 0b0100
const LEFT = 0b0010
const RIGHT = 0b0001
const UPRIGHT = UP + RIGHT
const UPLEFT = UP + LEFT
const DOWNRIGHT = DOWN + RIGHT
const DOWNLEFT = DOWN + LEFT

const BUTTON_DELAY = 50

const SCALE = 1.0 / 16.0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var operator = 0
var last = 0
var timeout = 0

var coordinates: Vector2

signal op_signal(op)

# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector2(SCALE, SCALE)
	coordinates = GlobalVariables.center
#	coordinates = Vector2(5, 5)
	position = _co2position(coordinates)
	print(position)
	pass # Replace with function body.
	
func _co2position(co=coordinates):
	return Vector2(co * GlobalVariables.SINGLE_SQUARE) + Vector2(GlobalVariables.SINGLE_SQUARE, GlobalVariables.SINGLE_SQUARE) * 0.5
	
func _reset_timeout():
	timeout = BUTTON_DELAY
#
#func get_input():
#	if Input.is_action_just_pressed("ui_right"):
#		input_signal = input_signal | RIGHT
#	if Input.is_action_just_pressed("ui_left"):
#		input_signal = input_signal | LEFT
#	if Input.is_action_just_pressed("ui_up"):
#		input_signal = input_signal | UP
#	if Input.is_action_just_pressed("ui_down"):
#		input_signal = input_signal | DOWN
		
		
func get_input():
	if Input.is_action_just_pressed("ui_right"):
		operator = operator | RIGHT
	if Input.is_action_just_pressed("ui_left"):
		operator = operator | LEFT
	if Input.is_action_just_pressed("ui_up"):
		operator = operator | UP
	if Input.is_action_just_pressed("ui_down"):
		operator = operator | DOWN
	
func _send_op():
	emit_signal("op_signal", operator)

func _on_success_op(op):
	match op:
		UP:
			$AnimateSprite2D.animation = "up"
			rotate( - rotation)
			move(1, -1)
		DOWN:
			$AnimateSprite2D.animation = "up"
			rotate(PI - rotation)
			move(1, 1)
		LEFT:
			$AnimateSprite2D.animation = "up"
			rotate(1.5*PI - rotation)
			move(0, -1)
		RIGHT:
			$AnimateSprite2D.animation = "up"
			rotate(0.5*PI - rotation)
			move(0, 1)
		UPRIGHT:
			$AnimateSprite2D.animation = "corner"
			rotate( - rotation)
		UPLEFT:
			$AnimateSprite2D.animation = "corner"
			rotate(1.5*PI - rotation)
		DOWNRIGHT:
			$AnimateSprite2D.animation = "corner"
			rotate(0.5*PI - rotation)
		DOWNLEFT:
			$AnimateSprite2D.animation = "corner"
			rotate(PI - rotation)
	
func move(idx, toward):
	coordinates[idx] += toward
	position = _co2position()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	if last == 0 and operator != 0:
		_reset_timeout()
	timeout -= (delta * 1000)
	if operator != 0 and timeout < 0:
		_send_op()
		operator = 0
	last = operator
