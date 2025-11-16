extends CharacterBody2D

const MAXHP = 3
var health = MAXHP
var plMoving = false
var pl_isHurt = false


var direction = Vector2.ZERO

func _physics_process(_delta):
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 400 
	move_and_slide()
	plMoving = bool(velocity.length())
	
func take_damage(dmg):
	health -= dmg
	print("HP: ",health)
	if health <= 0:
		death()
	
	pl_isHurt = true
		
func death():
	queue_free()
	const DEATH_ANIM = preload("res://entities/entity stuff/pl_death_anim.tscn")
	var dthAni_Inst = DEATH_ANIM.instantiate()
	get_parent().add_child(dthAni_Inst)
	dthAni_Inst.global_position = global_position


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hurt":
		pl_isHurt = false
