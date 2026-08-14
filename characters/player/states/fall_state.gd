extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	# Provisional: reuse idle animation until a dedicated fall animation exists.
	player.animation_player.play("idle")


func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("ui_left", "ui_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move()

	if player.is_on_floor():
		if is_equal_approx(input_direction_x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(WALK)
