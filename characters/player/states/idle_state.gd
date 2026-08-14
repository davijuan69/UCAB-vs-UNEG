extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity.x = 0.0
	player.animation_player.play("idle")


func physics_update(delta: float) -> void:
	player.velocity.y += player.gravity * delta
	player.move()

	if not player.is_on_floor():
		finished.emit(FALL)
	elif Input.is_action_just_pressed("ui_accept"):
		finished.emit(JUMP)
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		finished.emit(WALK)
