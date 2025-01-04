extends Node2D
@onready var travel_timer = $TravelTimer
@onready var travel_label = $TravelLabel
@onready var asteroid_spawner = $AsteroidSpawner
@onready var travel_is_over = $TravelIsOver
func _ready() -> void:
	start_travel()

func _process(delta: float) -> void:
	if travel_timer.is_stopped():
		return
	update_label(travel_timer.time_left)
	if Global.life <= 0 :
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func start_travel():
	var travel_time = Global.get_distance(Global.cur_station, Global.target_station) * 10
	travel_timer.wait_time = travel_time
	print(travel_time)
	travel_timer.start()
	update_label(travel_time)  # Atualizar o rótulo (se necessário)

# Atualizar o rótulo com o tempo restante
func update_label(time: float):
	if travel_label:
		travel_label.text = "Time remaining: " + str(round(time)) + " seconds"

func _on_travel_timer_timeout() -> void:
	print("Arrived at destination!")
	travel_is_over.visible = true
	Global.money += asteroid_spawner.money_now + Global.get_distance(Global.cur_station, Global.target_station) * 100
	print(asteroid_spawner.money_now + Global.get_distance(Global.cur_station, Global.target_station) * 100)
	Global.cur_station = Global.target_station
	
	# Mude para a cena da estação, se necessário
