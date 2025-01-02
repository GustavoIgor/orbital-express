extends CharacterBody2D

var SPEED = 200.0
var input_vector = Vector2.ZERO
@onready var animation : AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:

	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()

	velocity = input_vector * SPEED
	move_and_slide()
	# Obtém a posição global do mouse
	animation.play("Lighted")
	var mouse_position = get_global_mouse_position()
	print(mouse_position)
	# Faz a nave olhar para a posição do mouse
	look_at(mouse_position)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space") or event.is_action_pressed("click"):
		shoot()

func shoot() -> void:
	var bullet_instance = preload("res://Scenes/bullet.tscn").instantiate()
	bullet_instance.global_position = global_position
	bullet_instance.rotation = rotation
	get_parent().add_child(bullet_instance)
	# Adicione força ao projétil no script dele
