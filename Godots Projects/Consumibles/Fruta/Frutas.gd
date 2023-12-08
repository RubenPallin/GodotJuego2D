extends Node2D

var lista = []
var level2 = "res://Level2/level_2.tscn"

func _process(delta):
	lista = get_children()
	if lista.size() == 0:
		get_parent().get_node("Label").visible = true
		await (get_tree().create_timer(1.0).timeout)
		get_tree().change_scene_to_file(level2)
