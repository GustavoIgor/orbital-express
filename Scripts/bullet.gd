extends Node2D

# Variáveis configuráveis
@export var speed: float = 600.0  # Velocidade da bala
@export var lifetime: float = 2.0  # Tempo de vida da bala em segundos

# Tempo restante antes da bala desaparecer
var time_left: float

func _ready() -> void:
	time_left = lifetime

func _process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * speed * delta
	
	time_left -= delta
	if time_left <= 0:
		queue_free()

func _on_area_entered(body: Node) -> void:
	if body.name != "Player":
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):  # Verifica se é um inimigo
		body.take_damage()  # Chama um método do objeto colidido
		queue_free()  # Remove a bala
