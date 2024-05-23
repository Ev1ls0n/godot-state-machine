class_name StandbyState extends PlayerState


func _handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("ui_accept"):
		state_machine.transition_to("MeleeState")
	return
