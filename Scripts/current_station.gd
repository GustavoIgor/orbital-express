extends Panel

func _ready() -> void:
	var textlabel : RichTextLabel = $VBoxContainer/RichTextLabel
	match Global.cur_station:
		0:
			textlabel.text = "It's Alpha Station."
		1:
			textlabel.text = "It's Beta Outpost."
		2:
			textlabel.text = "It's Gamma Base."
		3:
			textlabel.text = "It's Delta Hub."
		4:
			textlabel.text = "It's Epsilon Colony."
		_:
			pass
	pass

func _process(delta: float) -> void:
	pass
