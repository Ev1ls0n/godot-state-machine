class_name IdleState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	player.velocity = Vector2.ZERO
	
	if not player.animated_sprite.is_playing():
		player.animated_sprite.play()
	player.set_directional_animation(player.look_direction, player.DirectionalAnimations.IDLE)
	
	return


func _handle_input(_event: InputEvent) -> void:
	if _event is InputEventKey and _event.is_pressed():
		if (_event as InputEventKey).keycode == KEY_ENTER:
			state_machine.transition_to("AttackState")


func _physics_update(_delta: float) -> void:
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"):
		state_machine.transition_to("MoveState")
	return
