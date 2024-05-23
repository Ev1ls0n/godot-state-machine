class_name MeleeState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	# BUG: Not working for some unknown reason.
	player.animation_tree["parameters/conditions/is_melee"] = true
	
	_attack()
	return


func _exit() -> void:
	# BUG: Not working for some unknown reason.
	player.animation_tree["parameters/conditions/is_melee"] = false
	return


func _attack() -> void:
	player.set_animation_direction(player.look_direction)
	state_machine.transition_to("StandbyState")
	return
