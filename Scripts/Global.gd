extends Node
var fuel : int = 100
var life : int = 100
var money : float = 1000.00
var time : int = 0
var days : int = 0
var cur_station : int = 0
var goods : Array = ["Data", "Energy", "Food", "Fuel", "Medicine", "Metal", "Water" ]
var stations : Array = [
	{"name": "Alpha Station", "resources": ["Fuel", "Food"], "missions": ["Deliver Supplies"]},
	{"name": "Beta Outpost", "resources": ["Metal"], "missions": ["Escort Ship"]},
	{"name": "Gamma Base", "resources": ["Data"], "missions": ["Repair Systems"]},
	{"name": "Delta Hub", "resources": ["Medicine"], "missions": ["Rescue Mission"]},
	{"name": "Epsilon Colony", "resources": ["Water", "Energy"], "missions": ["Colonization Support"]}
]

var distance : Array = [
	[0.0, 1.2, 3.5, 6.0, 9.5],  # Alpha Station
	[1.2, 0.0, 2.8, 5.0, 8.4],  # Beta Outpost
	[3.5, 2.8, 0.0, 2.5, 5.5],  # Gamma Base
	[6.0, 5.0, 2.5, 0.0, 2.2],  # Delta Hub
	[9.5, 8.4, 5.5, 2.2, 0.0]   # Epsilon Colony
]

# Método para obter informações de uma estação por índice
func get_station(index: int) -> Dictionary:
	if index >= 0 and index < stations.size():
		return stations[index]
	return {}

# Método para obter a distância entre duas estações
func get_distance(from_index: int, to_index: int) -> float:
	if from_index >= 0 and to_index >= 0 and from_index < stations.size() and to_index < stations.size():
		return distance[from_index][to_index]
	return -1.0  # Retorna -1 se os índices forem inválidos

# Método para calcular o tempo de viagem entre duas estações
func calculate_travel_time(from_index: int, to_index: int, speed: float) -> float:
	var distance = get_distance(from_index, to_index)
	if distance >= 0:
		return distance / speed
	return -1.0  # Retorna -1 se a distância não for válida

func change_scene_with_fade(scene_path: String) -> void:
	FadeLayer.transition()
	await FadeLayer.transition_finished
	get_tree().change_scene_to_file(scene_path)
