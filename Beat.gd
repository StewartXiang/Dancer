extends "res://BaseBeat.gd"

func _on_work_beat(op):
	pass

func _on_judge_beat(op):
	emit_signal("success_op_signal", op)
	
func _on_judge_over_beat(op):
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
