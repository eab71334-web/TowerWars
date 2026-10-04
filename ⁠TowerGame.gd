extends Node2D

class_name TowerGame

@export var block_speed: float = 300.0
var current_block: RigidBody2D = null
var tower_height: float = 0.0

# قائمة بأشكال الكتل المتاحة للتخريب أو السقوط العشوائي
var block_scenes = [
	"res://blocks/square_block.tscn",
	"res://blocks/long_block.tscn",
	"res://blocks/triangle_block.tscn"
]

func _ready() -> void:
	print("تم بدء لعبة TowerWars بنجاح!")
	spawn_new_block()

# وظيفة توليد كتلة جديدة تسقط من الأعلى
func spawn_new_block() -> void:
	# محاكاة إنشاء كتلة جديدة في الأعلى لكي يترتب عليها بناء البرج
	var random_choice = randi() % block_scenes.size()
	print("تم توليد كتلة جديدة للبرج رقم: ", random_choice)
	# هنا يتم إضافة الكود الخاص بإضافة الكتلة لبيئة اللعب

# زر التخريب: إرسال رياح قوية أو هزة أرضية لزعزعة برج الخصم أونلاين
func trigger_sabotage_wind(target_player_id: int) -> void:
	print("تحذير! تم تفعيل زر التخريب وإرسال رياح قوية للاعب رقم: ", target_player_id)
	# تطبيق قوة فيزيائية جانبية تؤثر على توازن كتل الخصم
	apply_wind_force_to_tower()

func apply_wind_force_to_tower() -> void:
	# محاكاة تأثير الرياح على الـ RigidBody للكتل
	var wind_force = Vector2(randf_range(-150.0, 150.0), -50.0)
	if current_block:
		current_block.apply_central_impulse(wind_force)
