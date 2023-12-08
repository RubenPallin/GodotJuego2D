extends CharacterBody2D

class_name Player

var speed := 120
var direccion := 0.0
var jump := 250
const gravity := 9
@onready var animation := $AnimationPlayer
@onready var sprite := $Sprite2D
@onready var frutasLabel := $PlayerGUI/HBoxContainer/FrutasLabel2

var can_jump := true  # Variable de estado para controlar si el personaje puede saltar

func _ready():
	Global.player = self

func _physics_process(delta):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed

	if direccion != 0:
		animation.play("walk")
	else:
		animation.play("idle")

	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h

	if can_jump and is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump
		can_jump = false  # Desactivar la posibilidad de saltar hasta que toque el suelo

	if !is_on_floor():
		velocity.y += gravity
	else:
		can_jump = true  # Habilitar la posibilidad de saltar cuando toque el suelo

	move_and_slide()

func actualizaInterfazFrutas():
	frutasLabel.text = str(Global.frutas)
