class_name IdleState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	player.velocity = Vector2.ZERO
	
	if _message.is_empty():
		player.animated_sprite.animation = "idle_down"
	else:
		_set_idle_animation(_message.get("direction") as Vector2)
	
	return


func _physics_update(_delta: float) -> void:
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"):
		state_machine.transition_to("MoveState")
	return


func _set_idle_animation(direction: Vector2) -> void:
	if (direction.x != 0 and direction.y == 0):
		player.animated_sprite.animation = "idle_right"
		player.animated_sprite.flip_h = direction.x < 0
	elif (direction.y < 0):
		player.animated_sprite.animation = "idle_top"
		player.animated_sprite.flip_h = false
	elif (direction.y > 0):
		player.animated_sprite.animation = "idle_down"
		player.animated_sprite.flip_h = false
	return
