extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity.y = -player.jump_impulse
	# Provisional: reuse jump animation until a dedicated jump animation exists.
	player.animation_player.play("jump")


func physics_update(delta: float) -> void:
	player.apply_horizontal_input()
	player.apply_gravity_and_move(delta)

	if player.velocity.y >= 0.0:
		finished.emit(FALL)
