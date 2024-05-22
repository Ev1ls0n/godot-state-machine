class_name IdleState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	player.velocity = Vector2.ZERO
	player.set_directional_animation(player.look_direction, player.DirectionalAnimations.IDLE)
	return


func _physics_update(_delta: float) -> void:
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"):
		state_machine.transition_to("MoveState")
	return
