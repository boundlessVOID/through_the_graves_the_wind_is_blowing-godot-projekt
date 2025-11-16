extends Node2D

@export var animation_tree : AnimationTree
@onready var charB : CharacterBody2D = get_owner()
#var facing = Vector2.RIGHT
#var isHurt = false
#func _physics_process(_delta: float) -> void:
	#
	#var idle = !charB.velocity
	#
	#if !idle:
		#facing = charB.direction.normalized()
	#
	#animation_tree.set("parameters/Run/blend_position", facing)
	#animation_tree.set("parameters/Idle/blend_position", facing)
	#animation_tree.set("parameters/MelAtkCharge/blend_position", facing.x)
	##animation_tree.set("parameters/MelAtk/blend_position", facing.x)
	
#func atk():
	#pass	
