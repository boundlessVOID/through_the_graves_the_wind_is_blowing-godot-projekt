extends CharacterBody2D

var rng = RandomNumberGenerator.new()

const MAXHP = 3
var health = MAXHP
const MAX_SPEED = 200
var speed = MAX_SPEED

const MELEE_ATTACK = preload("res://entities/entity stuff/mel_atk_mob_1.tscn")
var atkBox : Area2D

var player : CharacterBody2D
var playPos

func _ready() -> void:
	player  = get_parent().get_node("Player")
	playPos = player.global_position

var canMelAtk = true
var isHurt = false
var isMelAtk = false

var direction = Vector2.ZERO
var facingX = 1
var mobMoving = false

func _physics_process(_delta):
	#$Mob010Animation.scale.x = -1
	direction = global_position.direction_to(playPos)
	if !isMelAtk and player != null:
		playPos = player.global_position
		
		velocity = direction * speed
	facingX = sign(direction.x)
	#print(direction.x)
	$Mob010Animation.scale.x  = facingX+abs(facingX)-1
	#print($PlayerSpriteRed.scale.x)
	checkMelRange()
	mobMoving = bool(velocity.length())
	move_and_slide()

func checkMelRange():
	var atkRangeRng = rng.randf_range(41, 80)
	if global_position.distance_to(playPos)<atkRangeRng:
			if canMelAtk and !isHurt:
				melAtkCh()
			if global_position.distance_to(playPos)<40:
					velocity = Vector2.ZERO
func melAtkCh():
	canMelAtk = false
	isMelAtk = true
	velocity = Vector2.ZERO
	$MeleeAttackCD.start()
func melAtk():
	atkBox = MELEE_ATTACK.instantiate()
	%MelAtkOrigin.add_child(atkBox)
	

func take_damage(dmg):
	health -= dmg
	speed -= dmg * MAX_SPEED / (MAXHP+2)
	if health == 0:
		death()
	
	isHurt = true
		
func death():
	queue_free()
	const DEATH_ANIM = preload("res://entities/entity stuff/mob_death_anim.tscn")
	var dthAni_Inst = DEATH_ANIM.instantiate()
	get_parent().add_child(dthAni_Inst)
	dthAni_Inst.global_position = global_position


func _on_melee_attack_cd_timeout() -> void:
	canMelAtk = true
	#print("can Atk again")




func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hurt":
		isHurt = false
	elif anim_name == "atk":
		atkBox.queue_free()
		isMelAtk = false
	elif anim_name == "atkCh":
		#$atkDelay.start()
		melAtk()


#func _on_atk_delay_timeout() -> void:
	#melAtk()
