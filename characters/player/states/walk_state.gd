extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.animation_player.play("walk")


func physics_update(delta: float) -> void:
	var input_direction_x := player.apply_horizontal_input()
	player.apply_gravity_and_move(delta)

	if not player.is_on_floor():
		finished.emit(FALL)
	elif Input.is_action_just_pressed("jump"):
		finished.emit(JUMP)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
