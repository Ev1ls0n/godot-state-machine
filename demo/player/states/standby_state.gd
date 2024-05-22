class_name StandbyState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	# TODO: Make a check for the necessity of this call, or find a better way to do it.
	player.movement_state_machine.current_state._enter()
	return


func _handle_input(_event: InputEvent) -> void:
	if _event is InputEventKey and _event.is_pressed():
		if (_event as InputEventKey).keycode == KEY_ENTER:
			state_machine.transition_to("MeleeState")
	return
