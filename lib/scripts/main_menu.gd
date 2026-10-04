extends Control

# الربط مع الأزرار عند الضغط
func _ready():
	$MarginContainer/VBoxContainer/PanelContainer/VBoxContainer/StartButton.pressed.connect(_on_start_pressed)

func _on_start_pressed():
	# الانتقال لمشهد اللعبة الـ 3D عند الضغط على "ابدأ اللعب"
	get_tree().change_scene_to_file("res://scenes/game_level.tscn")
