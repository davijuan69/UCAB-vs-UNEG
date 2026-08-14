class_name PlayerState extends State

const IDLE := "Idle"
const WALK := "Walk"
const JUMP := "Jump"
const FALL := "Fall"

var player: Player


func _ready() -> void:
	# The PlayerState type must be used only in the player scene. It needs the owner to be a Player node.
	await owner.ready
	player = owner as Player
	assert(player != null, "PlayerState must be used inside a scene whose root is a Player node.")
