class_name StandbyState extends PlayerState


func _handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("ui_home"):
		state_machine.transition_to("MeleeState", {"is_slow":false})
	if _event.is_action_pressed("ui_page_up"):
		state_machine.transition_to("MeleeState", {"is_slow":true})
	return
