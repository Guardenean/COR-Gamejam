extends Node
#chatgptinutil
@export var min_value: float = 0.0
@export var max_value: float = 100.0
@export var update_interval: float = 1.0

var time_elapsed: float = 0.0
var progress_bar: ProgressBar

func _ready():
	progress_bar = $"."
	progress_bar.min_value = min_value
	progress_bar.max_value = max_value

func _process(delta: float):
	time_elapsed += delta
	if time_elapsed >= update_interval:
		# Gera e atualiza o valor da barra
		progress_bar.value = _equilibrador()
		#_mede_calor(progress_bar.value)
		time_elapsed = 0.0

func _equilibrador() -> float:
	var random = randi() % 100  # Gera um número entre 0 e 99
	if random < 70:  # 70% de chance de estar até 50%
		return randf_range(min_value, max_value / 2)
	else:  # 30% de chance de estar entre 50% e 100%
		return randf_range(max_value / 2, max_value)

func _mede_calor(value: float):
	if value >= 90:
		print("O Mundo está em chamas: 40°")
	elif value >= 70:
		print("Onda forta de calor: 28°")
	elif value >= 50:
		print("Está Calor: 25°")
	elif value >= 30:
		print("Calor: 20°")
	else:
		print("Frio: abaixo dos 18°")
