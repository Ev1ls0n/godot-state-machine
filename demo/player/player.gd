class_name PlayerCharacter extends CharacterBody2D


enum DirectionalAnimations {IDLE, MOVE, ATTACK}


var look_direction: Vector2 = Vector2.DOWN
var movement_speed: float = 100.0

@onready var animated_sprite := get_node("AnimatedSprite2D") as AnimatedSprite2D


func set_directional_animation(direction: Vector2, animation_set: DirectionalAnimations) -> void:
	var current_animation_set: Dictionary = _get_animation_set(animation_set)
	if (direction.x != 0 and direction.y == 0):
		animated_sprite.animation = current_animation_set["right"]
		animated_sprite.flip_h = direction.x < 0
	elif (direction.y < 0):
		animated_sprite.animation = current_animation_set["top"]
		animated_sprite.flip_h = false
	elif (direction.y > 0):
		animated_sprite.animation = current_animation_set["down"]
		animated_sprite.flip_h = false
	return


func _get_animation_set(animation_set: DirectionalAnimations) -> Dictionary:
	var result: Dictionary
	match animation_set:
		DirectionalAnimations.IDLE:
			result = {"right":"idle_right", "top":"idle_top", "down":"idle_down"}
		DirectionalAnimations.MOVE:
			result = {"right":"move_right", "top":"move_top", "down":"move_down"}
		DirectionalAnimations.ATTACK:
			result = {"right":"attack_right", "top":"attack_top", "down":"attack_down"}
	return result
