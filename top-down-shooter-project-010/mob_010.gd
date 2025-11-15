extends CharacterBody2D

const MAXHP = 5
var health = MAXHP
const MAX_SPEED = 150
var speed = MAX_SPEED
var canMelAtk = true

@onready var player  = get_node("/root/Game/Player")

@onready var animationArr = [
	[Callable($PlayerSpriteRed.play_idle_L),Callable($PlayerSpriteRed.play_idle_R)],
	[Callable($PlayerSpriteRed.play_run_L), Callable($PlayerSpriteRed.play_run_R)]
]
	
var facing = 1
var facingArr = [0, facing, 1]
var aninmSpeedArr = [[1,1],[1,1]]

func _physics_process(_delta):
	var playPos = player.global_position
	var direction = global_position.direction_to(playPos)
	velocity = direction * speed
	if global_position.distance_to(playPos)<150:
		#print("dist: ",global_position.distance_to(playPos))
		if canMelAtk:
			print("attack!")
			canMelAtk = false
		if global_position.distance_to(playPos)<40:
			velocity = Vector2.ZERO
	move_and_slide()
	
	if %AnimationPlayer.current_animation != "hurt":
		facingArr[1] = facing
		facing = facingArr[int(sign(direction.x))+1]
		animationArr[int(bool(velocity.length()))][facing].call()
		%AnimationPlayer.speed_scale = aninmSpeedArr[int(bool(velocity.length()))][facing]

	
func take_damage(dmg):
	#print("ow!")
	health -= dmg
	speed -= dmg * MAX_SPEED / (MAXHP+2)
	if health == 0:
		death()
	%AnimationPlayer.speed_scale = 2
	$PlayerSpriteRed.playHurt()
	
func death():
	queue_free()
	const DEATH_ANIM = preload("res://mob_death_anim.tscn")
	var dthAni_Inst = DEATH_ANIM.instantiate()
	get_parent().add_child(dthAni_Inst)
	dthAni_Inst.global_position = global_position


func _on_melee_attack_cd_timeout() -> void:
	canMelAtk = true
