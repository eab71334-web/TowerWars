extends Node2D

class_name TowerGame

@export var block_speed: float = 350.0
var current_score: int = 0
var is_sabotaged: bool = false

func _ready() -> void:
	print("تم بدء لعبة TowerWars بنجاح باستخدام Godot!")
	spawn_block()

# وظيفة إسقاط كتلة جديدة في البرج
func spawn_block() -> void:
	current_score += 1
	print("تم إسقاط كتلة جديدة. ارتفاع البرج الحالي: ", current_score)

# زر التخريب: إرسال رياح لزعزعة برج الخصم أونلاين
func trigger_sabotage() -> void:
	is_sabotaged = true
	print("⚠ تم تفعيل زر التخريب وإرسال رياح قوية!")
	
	# إيقاف تأثير التخريب بعد ثانيتين
	await get_tree().create_timer(2.0).timeout
	is_sabotaged = false
	print("✔ انتهى تأثير الرياح، عاد البرج لحالته الطبيعية.")
