class_name MoveState extends PlayerState


func _physics_update(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		player.look_direction = direction
		player.velocity = direction * player.movement_speed
		player.move_and_slide()
		player.set_directional_animation(direction, player.DirectionalAnimations.MOVE)
	else:
		state_machine.transition_to("IdleState")
	return
