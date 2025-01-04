extends CanvasLayer

@onready var stats : Panel = $Control/Stats
@onready var current_station : Panel = $Control/CurrentStation
@onready var next_station : Panel = $Control/NextStation
@onready var shop : Panel = $Control/Shop
func _ready() -> void:
	if Global.money > 10000:
		get_tree().change_scene_to_file("res://Scenes/win.tscn")

func _on_stats_pressed() -> void:
	stats.visible = true
	current_station.visible = false
	next_station.visible = false
	shop.visible = false

func _on_current_station_pressed() -> void:
	stats.visible = false
	current_station.visible = true
	next_station.visible = false
	shop.visible = false

func _on_next_station_pressed() -> void:
	stats.visible = false
	current_station.visible = false
	next_station.visible = true
	shop.visible = false

func _on_shop_pressed() -> void:
	stats.visible = false
	current_station.visible = false
	next_station.visible = false
	shop.visible = true
