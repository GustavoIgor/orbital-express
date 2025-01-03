extends CanvasLayer

@onready var stats : Panel = $Control/Stats
@onready var current_station : Panel = $Control/CurrentStation
@onready var next_station : Panel = $Control/NextStation
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_stats_pressed() -> void:
	stats.visible = true
	current_station.visible = false
	next_station.visible = false

func _on_current_station_pressed() -> void:
	stats.visible = false
	current_station.visible = true
	next_station.visible = false

func _on_next_station_pressed() -> void:
	stats.visible = false
	current_station.visible = false
	next_station.visible = true
