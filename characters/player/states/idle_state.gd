extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity.x = 0.0
	player.animation_player.play("idle")


func handle_input(event: InputEvent) -> void:
	# Combat actions are reserved for future states; they're logged while waiting
	# for dedicated animations (Punch, Kick, Block).
	if event.is_action_pressed("punch"):
		push_warning("'punch' pressed: waiting for PunchState animation.")
	elif event.is_action_pressed("kick"):
		push_warning("'kick' pressed: waiting for KickState animation.")
	elif event.is_action_pressed("block"):
		push_warning("'block' pressed: waiting for BlockState animation.")


func physics_update(delta: float) -> void:
	player.apply_gravity_and_move(delta)

	if not player.is_on_floor():
		finished.emit(FALL)
	elif Input.is_action_just_pressed("jump"):
		finished.emit(JUMP)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(WALK)
