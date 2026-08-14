class_name Player extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_impulse: float = 400.0
@export var gravity: float = 980.0

@onready var animation_player: AnimatedSprite2D = %Sprite


func move() -> void:
	move_and_slide()
