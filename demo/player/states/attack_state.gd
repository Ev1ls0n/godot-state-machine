class_name AttackState extends PlayerState


func _enter(_message: Dictionary = {}) -> void:
	player.set_directional_animation(player.look_direction, player.DirectionalAnimations.ATTACK)
	await player.animated_sprite.animation_finished
	state_machine.transition_to("IdleState")
	return
