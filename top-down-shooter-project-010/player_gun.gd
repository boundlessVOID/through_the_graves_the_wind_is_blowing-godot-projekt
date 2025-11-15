extends Node2D
var bullet = preload("res://player_bullet.tscn")
var canFire = true
func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	look_at(mouse)
	var facing = sign(mouse.x - global_position.x) 
	scale.y = -1+facing+abs(facing)
	if (Input.is_action_just_pressed("attack_main") and canFire) :
		fire()
func fire():
	$GunPhSpriteSh.play_Fire()
	var bullet_instance = bullet.instantiate()
	%MuzzleMarker.add_child(bullet_instance)
	
	bullet_instance.global_position = %MuzzleMarker.global_position
	bullet_instance.global_rotation = %MuzzleMarker.global_rotation

	$FireRateTimer.start()
	canFire = false

func _on_timer_timeout() -> void:
	canFire = true
