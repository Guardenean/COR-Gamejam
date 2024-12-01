extends Node

## Valor mínimo do peso
@export var min_value: float = 0.0
## Valor máximo do peso
@export var max_value: float = 100.0

## Node da barra de calor
@export var calor_bar: ProgressBar
## Node da barra de chuva
@export var chuva_bar: ProgressBar

# Timer
@onready var timer = $Timer

# Variável para armazenar o valor atual do calor
var calor_atual: float = 0.0
var chuva_atual: float = 0.0


func _equilibrador() -> float:
	var random = randi() % 100  # Gera um número entre 0 e 99
	if random < 70:  # 70% de chance de estar até 50%
		return randf_range(min_value, max_value / 2)
	else:  # 30% de chance de estar entre 50% e 100%
		return randf_range(max_value / 2, max_value)

func _mede_valor(valor: float):
	# Atualiza o calor atual
	if valor >= 90:
		return 4
	elif valor >= 70:
		return 3
	elif valor >= 50:
		return 2
	elif valor >= 30:
		return 1
	else:
		return 0


func _on_timer_timeout():
	var calor = _equilibrador()
	calor_bar.value = calor
	calor_atual = _mede_valor(calor)
	
	var chuva = _equilibrador()
	chuva_bar.value = chuva
	chuva_atual = _mede_valor(chuva)
