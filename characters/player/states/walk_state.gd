extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.animation_player.play("walk")


func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("ui_left", "ui_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move()

	if not player.is_on_floor():
		finished.emit(FALL)
	elif Input.is_action_just_pressed("ui_accept"):
		finished.emit(JUMP)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
