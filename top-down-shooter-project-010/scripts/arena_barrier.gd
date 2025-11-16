extends Area2D

var arenaArea : Area2D
var enemies : Array
var primed = false

var prevEnemies = 0

func _ready() -> void:
	arenaArea = get_parent()
	#enemies = arenaArea.get_overlapping_bodies()
	print(arenaArea)
	#print(enemies.size())
	$Timer.start()

func _physics_process(_delta: float) -> void:
	enemies = arenaArea.get_overlapping_bodies()
	if enemies.size() != prevEnemies:
		print(enemies.size()," enemies remaining")
		prevEnemies = enemies.size()
		if enemies.size() <= 0 and primed:
			open()
func open():
	queue_free()
	print("open sesame!")
	const OPEN_ANIM = preload("res://gate_opn_anim.tscn")
	var opnAnim_Inst = OPEN_ANIM.instantiate()
	get_parent().add_child(opnAnim_Inst)
	opnAnim_Inst.position = position


func _on_timer_timeout() -> void:
	primed = true
