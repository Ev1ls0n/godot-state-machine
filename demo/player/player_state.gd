## Boilerplate class to get full autocompletion and type checks for the `player`
## when coding the player's states.
class_name PlayerState extends State


## Typed reference to the player node.
var player: PlayerCharacter


func _ready() -> void:
	await owner.ready # First wait for the `owner` `_ready()` to be ready.
	if owner is PlayerCharacter:
		player = owner as PlayerCharacter
	else:
		print_debug("{o} is not of type PlayerCharacter".format({"o": owner.name}))
	return
