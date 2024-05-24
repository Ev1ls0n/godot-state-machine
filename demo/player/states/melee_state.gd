class_name MeleeState extends PlayerState


var _is_slow: bool = false


func _enter(_message: Dictionary = {}) -> void:
	_is_slow = _message["is_slow"]
	
	if _is_slow:
		player.can_move = false
		player.animation_playback.start("Melee")
	else:
		player.animation_playback.travel("Melee")
	
	_attack()
	return


func _attack() -> void:
	player.set_animation_direction(player.look_direction)
	state_machine.transition_to("StandbyState")
	return


func _exit() -> void:
	if _is_slow:
		await player.animation_tree.animation_finished
		player.can_move = true
	return
