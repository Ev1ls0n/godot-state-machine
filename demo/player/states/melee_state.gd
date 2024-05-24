class_name MeleeState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	player.animation_playback.travel("Melee")
	_attack()
	return


func _attack() -> void:
	player.set_animation_direction(player.look_direction)
	state_machine.transition_to("StandbyState")
	return
