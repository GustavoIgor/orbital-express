extends Panel

func _ready() -> void:
	var textlabel : RichTextLabel = $VBoxContainer/RichTextLabel
	match Global.cur_station:
		0:
			textlabel.text = "It's Alpha Station."
		_:
			pass
	pass

func _process(delta: float) -> void:
	pass
