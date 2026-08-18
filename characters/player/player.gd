class_name Player extends CharacterBody2D

@export var speed: float = 65.0
@export var jump_impulse: float = 170.0
@export var gravity: float = 450.0

@onready var animation_player: AnimatedSprite2D = %Sprite


func apply_horizontal_input() -> float:
	var axis := Input.get_axis("move_left", "move_right")
	velocity.x = speed * axis
	return axis


func apply_gravity_and_move(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()
