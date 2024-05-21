## Virtual base class for all states.
class_name State extends Node


## Reference to the state machine, to call its `transition_to()` method directly.
var state_machine: StateMachine = null


## Virtual function. Called by the state machine upon changing the active state.
## The `msg` parameter is a dictionary with arbitrary data the state can use to initialize itself.
func _enter(_message: Dictionary = {}) -> void:
	pass


## Virtual function. Called by the state machine before changing the active state.
## Use this function to clean up the state.
func _exit() -> void:
	pass


## Virtual function. Receives events from the `_unhandled_input()` callback.
func _handle_input(_event: InputEvent) -> void:
	pass


## Virtual function. Corresponds to the `_process()` callback.
func _update(_delta: float) -> void:
	pass


## Virtual function. Corresponds to the `_physics_process()` callback.
func _physics_update(_delta: float) -> void:
	pass
