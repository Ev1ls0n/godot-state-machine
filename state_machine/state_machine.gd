## Generic state machine. Initializes states and delegates engine callbacks
## (_physics_process, _unhandled_input) to the active state.
class_name StateMachine extends Node


## Emitted when transitioning to a new state.
signal transitioned(state_name: String)


## Path to the initial active state.
@export var initial_state: NodePath = NodePath()

## The current active state. At the start of the game, we get the `initial_state`.
@onready var current_state: State = get_node(initial_state)


func _ready() -> void:
	# First wait for the `owner` `_ready()` to be ready.
	await owner.ready
	
	# The state machine assigns itself to the State objects' state_machine property.
	for child in get_children():
		if child is State:
			child.state_machine = self
	
	current_state._enter()
	return


func _unhandled_input(event: InputEvent) -> void:
	current_state._handle_input(event)
	return


func _process(delta: float) -> void:
	current_state._update(delta)
	return


func _physics_process(delta: float) -> void:
	current_state._physics_update(delta)
	return


## This function calls the current state's exit() function, then changes the active state,
## and calls its enter function.
func transition_to(target_state_name: String, _message: Dictionary = {}) -> void:
	if has_node(target_state_name):
		current_state._exit()
		current_state = get_node(target_state_name)
		current_state._enter(_message)
		transitioned.emit(current_state.name)
	return
