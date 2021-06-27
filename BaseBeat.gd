extends Area2D
enum Status {FALL, WORK, JUDGE, JUDGE_OVER, STOP}

var _beat_timer: Node
var _user: Node
var status = 0
signal success_op_signal(op)

# Called when the node enters the scene tree for the first time.

func init(b, u):
	_beat_timer = b
	_user = u

func _fall():
	status = Status.FALL
	
func _work():
	if _user:
		_user.connect("op_signal", self, "_on_op")
		connect("success_op_signal", _user, "_on_success_op")
	status = Status.WORK
	
func _judge():
	status = Status.JUDGE
	
func _judge_over():
	status = Status.JUDGE_OVER
	
func _stop():
	if _user:
		_user.disconnect("op_signal", self, "_on_op")
		disconnect("success_op_signal", _user, "_on_success_op")
	status = Status.STOP
#	hide()
	queue_free()
	
func _timer():
#	_fall()
	yield(get_tree().create_timer(GlobalVariables.falling_time - GlobalVariables.SPB / 2), "timeout")
	_work()
	yield(get_tree().create_timer((GlobalVariables.SPB - GlobalVariables.judge_time) / 2), "timeout")
	_judge()
	yield(get_tree().create_timer(GlobalVariables.judge_time), "timeout")
	_judge_over()
	yield(get_tree().create_timer((GlobalVariables.SPB - GlobalVariables.judge_time) / 2), "timeout")
	_stop()
	
func _ready():
	_timer()
	pass

func _process(delta):
	position += Vector2(0, GlobalVariables.falling_speed*delta)
	pass
	

func _on_op(operator):
	match status:
		Status.WORK:
			_on_work_beat(operator)
		Status.JUDGE:
			_on_judge_beat(operator)
		Status.JUDGE_OVER:
			_on_judge_over_beat(operator)

func _on_work_beat(op):
	pass

func _on_judge_beat(op):
	pass
	
func _on_judge_over_beat(op):
	pass
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
