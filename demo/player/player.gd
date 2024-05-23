class_name PlayerCharacter extends CharacterBody2D


var look_direction: Vector2 = Vector2.DOWN
var movement_speed: float = 100.0

@onready var animated_sprite := get_node("AnimatedSprite2D") as AnimatedSprite2D
@onready var animation_tree := get_node("AnimationTree") as AnimationTree


# NOTE: I have no idea why changing the animator parameters doesn't work in the melee state code.
# WARNING: _transition_to_next_recursive: AnimationNodeStateMachinePlayback:
# parameters/playback aborts the transition by detecting one or more looped transitions
# in the same frame to prevent to infinity loop. You may need to check the transition settings.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		animation_tree["parameters/conditions/is_melee"] = true
	elif event.is_action_released("ui_accept"):
		animation_tree["parameters/conditions/is_melee"] = false
	return


func set_animation_direction(direction: Vector2) -> void:
	animation_tree["parameters/Melee/blend_position"] = direction
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Move/blend_position"] = direction
	
	# BUG: If you constantly flip the sprite, the animation will play infinitely.
	animated_sprite.flip_h = direction.x < 0
	return
