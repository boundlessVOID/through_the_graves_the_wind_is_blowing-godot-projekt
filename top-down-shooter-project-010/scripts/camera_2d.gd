extends Camera2D

var player : CharacterBody2D
var playPos

func _ready() -> void:
	player  = get_parent().get_node("Player")
	playPos = player.global_position
	global_position = playPos
func _physics_process(_delta: float) -> void:
	if player != null:
		playPos = player.global_position
		#print(playPos)
		global_position = playPos
