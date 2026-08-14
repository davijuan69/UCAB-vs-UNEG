extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity.y = -player.jump_impulse
	# Provisional: reuse walk animation until a dedicated jump animation exists.
	player.animation_player.play("walk")


func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("ui_left", "ui_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move()

	if player.velocity.y >= 0.0:
		finished.emit(FALL)
