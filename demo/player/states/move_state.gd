class_name MoveState extends PlayerState


var _last_direction: Vector2 = Vector2.ZERO


func _physics_update(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		player.velocity = direction * player.movement_speed
		player.move_and_slide()
		
		_set_motion_animation(direction)
		_last_direction = direction
	else:
		state_machine.transition_to("IdleState", {"direction" : _last_direction})
	return


func _set_motion_animation(direction: Vector2) -> void:
	if (direction.x != 0 and direction.y == 0):
		player.animated_sprite.animation = "move_right"
		player.animated_sprite.flip_h = direction.x < 0
	elif (direction.y < 0):
		player.animated_sprite.animation = "move_top"
		player.animated_sprite.flip_h = false
	elif (direction.y > 0):
		player.animated_sprite.animation = "move_down"
		player.animated_sprite.flip_h = false
	return
