extends Node2D

@export var asteroid_scene: PackedScene = preload("res://Scenes/asteroid.tscn")
@export var spawn_interval: float = 1.0  # Intervalo entre spawns
@export var spawn_area: Vector2 = Vector2(200, 600)  # Área vertical para spawn
var spawn_timer = 0.0
var money_now : int

func _process(delta: float) -> void:
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_timer = spawn_interval
		spawn_asteroid(Vector2(
		position.x,
		position.y + randf_range(-spawn_area.y / 2, spawn_area.y / 2)
	), Asteroid.AsteroidSize.LARGE)

func _on_asteroid_exploded(pos, size, money_gained):
	
	for i in range(2):
		money_now += money_gained
		match size:
			Asteroid.AsteroidSize.LARGE:
				spawn_asteroid(pos, Asteroid.AsteroidSize.MEDIUM)
			Asteroid.AsteroidSize.MEDIUM:
				spawn_asteroid(pos, Asteroid.AsteroidSize.SMALL)
			Asteroid.AsteroidSize.SMALL:
				pass
		print(money_gained)

func spawn_asteroid(pos, size):
	var a = asteroid_scene.instantiate()
	a.global_position = pos
	a.size = size
	a.connect("exploded", _on_asteroid_exploded)
	add_child(a)
