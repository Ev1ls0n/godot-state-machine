class_name PlayerCharacter extends CharacterBody2D


var look_direction: Vector2 = Vector2.DOWN
var movement_speed: float = 100.0
var can_move: bool = true

var animation_playback: AnimationNodeStateMachinePlayback

@onready var sprite := get_node("Sprite2D") as Sprite2D
@onready var animation_tree := get_node("AnimationTree") as AnimationTree


func _ready() -> void:
	animation_playback = animation_tree.get("parameters/playback")
	return


func set_animation_direction(direction: Vector2) -> void:
	animation_tree["parameters/Melee/blend_position"] = direction
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Move/blend_position"] = direction
	sprite.flip_h = direction.x < 0
	return
