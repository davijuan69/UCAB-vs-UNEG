extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	# Provisional: reuse fall animation until a dedicated fall animation exists.
	player.animation_player.play("fall")


func physics_update(delta: float) -> void:
	var input_direction_x := player.apply_horizontal_input()
	player.apply_gravity_and_move(delta)

	if player.is_on_floor():
		if is_equal_approx(input_direction_x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(WALK)
