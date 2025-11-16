extends Node2D

@export var animation_tree : AnimationTree
@onready var charB : CharacterBody2D = get_owner()

var facing := Vector2.RIGHT
var isHurt = false

func _physics_process(_delta: float) -> void:
	
	var idle = !charB.velocity
	
	if !idle:
		#print("!idle")
		facing = charB.direction
	
	animation_tree.set("parameters/Run/blend_position", facing)
	animation_tree.set("parameters/Idle/blend_position", facing)
