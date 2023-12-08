extends Node
@onready var audio := $AudioStreamPlayer
var player_scene = preload("res://Jugador/node_2d.tscn")

func _ready():
	aparecer()
	audio.play()
	
func aparecer():
	var newplayer = player_scene.instantiate() 
	newplayer.position = $spawn_player.position
	add_child(newplayer)


func dead():
	pass
