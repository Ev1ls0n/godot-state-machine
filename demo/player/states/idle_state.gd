class_name IdleState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	player.animation_tree["parameters/conditions/is_idle"] = true
	player.animation_playback.travel("Idle")
	player.set_animation_direction(player.look_direction)
	return


func _exit() -> void:
	player.animation_tree["parameters/conditions/is_idle"] = false
	return


func _physics_update(_delta: float) -> void:
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"):
		state_machine.transition_to("MoveState")
	return
