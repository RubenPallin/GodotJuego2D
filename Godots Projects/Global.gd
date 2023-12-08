extends Node
var player
var frutas := 0 : 
	set(val): 
		frutas = val
		if player != null:
			player.actualizaInterfazFrutas()
	get:
		return frutas
	

