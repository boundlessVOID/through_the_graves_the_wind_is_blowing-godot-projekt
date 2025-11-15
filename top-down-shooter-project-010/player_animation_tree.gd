extends Node2D

@export var animation_tree : AnimationTree
@onready var player : CharacterBody2D = get_owner()
var facing = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	
	var idle = !player.velocity
	
	if !idle:
		facing = player.direction.normalized()
	
	animation_tree.set("parameters/Run/blend_position", facing)
	animation_tree.set("parameters/Idle/blend_position", facing)
