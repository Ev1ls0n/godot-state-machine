class_name MoveState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	player.animation_tree["parameters/conditions/is_moving"] = true
	player.animation_playback.travel("Move")
	return


func _exit() -> void:
	player.animation_tree["parameters/conditions/is_moving"] = false
	return


func _physics_update(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction and player.can_move:
		player.look_direction = direction
		player.velocity = direction * player.movement_speed
		player.move_and_slide()
		player.set_animation_direction(direction)
	else:
		state_machine.transition_to("IdleState")
	return
