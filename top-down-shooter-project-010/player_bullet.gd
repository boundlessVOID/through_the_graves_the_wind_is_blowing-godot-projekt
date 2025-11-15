extends Area2D

const bulletSpeed = 800
var travelDistance = 0
const maxTravD = 5000
var dmg = 1

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * bulletSpeed * delta
	#print(global_position)
	travelDistance += bulletSpeed * delta
	if travelDistance > maxTravD:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(dmg)


func _on_area_entered(area: Area2D) -> void:
	queue_free()
	if area.get_parent().has_method("take_damage"):
		area.get_parent().take_damage(dmg)
