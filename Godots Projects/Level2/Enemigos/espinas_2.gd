extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		body.queue_free()
		get_parent().get_parent().aparecer()
