class_name PlayerCharacter extends CharacterBody2D


var look_direction: Vector2 = Vector2.DOWN
var movement_speed: float = 100.0

@onready var animated_sprite := get_node("AnimatedSprite2D") as AnimatedSprite2D
@onready var animation_tree := get_node("AnimationTree") as AnimationTree


func set_animation_direction(direction: Vector2) -> void:
	animation_tree["parameters/Melee/blend_position"] = direction
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Move/blend_position"] = direction
	
	# BUG: If you constantly flip the sprite, the animation will play infinitely.
	animated_sprite.flip_h = direction.x < 0
	return
