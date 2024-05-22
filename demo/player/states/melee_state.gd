class_name MeleeState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	_attack()
	return


func _update(_delta: float) -> void:
	player.just_flip_h(player.look_direction)
	return


func _attack() -> void:
	player.set_directional_animation(player.look_direction, player.DirectionalAnimations.ATTACK)
	player.is_animation_locked = true
	await player.animated_sprite.animation_finished
	player.is_animation_locked = false
	state_machine.transition_to("StandbyState")
	return
