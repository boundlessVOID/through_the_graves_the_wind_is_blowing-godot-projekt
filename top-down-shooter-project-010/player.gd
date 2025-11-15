extends CharacterBody2D

const MAXHP = 10
var health = MAXHP

@onready var animationArr = [
	[Callable($PlayerSprite.play_idle_L),Callable($PlayerSprite.play_idle_R)],
	[Callable($PlayerSprite.play_run_L), Callable($PlayerSprite.play_run_R)]
]
var facing = 1
var facingArr = [0, facing, 1]
var aninmSpeedArr = [[1,1],[2,2]]

var direction = Vector2.ZERO

func _physics_process(_delta):
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 400
	move_and_slide()
	
	#facingArr[1] = facing
	#facing = facingArr[int(sign(direction.x))+1]
	#animationArr[int(bool(velocity.length()))][facing].call()
	#%AnimationPlayer.speed_scale = aninmSpeedArr[int(bool(velocity.length()))][facing]
