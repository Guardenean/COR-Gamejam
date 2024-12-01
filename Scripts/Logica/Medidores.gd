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

func _mede_calor(valueC: float):
	# Atualiza o calor atual
	calor_atual = valueC
	
	#if valueC >= 90:
		#print("O Mundo está em chamas: 40°")
	#elif valueC >= 70:
		#print("Onda forte de calor: 28°")
	#elif valueC >= 50:
		#print("Está Calor: 25°")
	#elif valueC >= 30:
		#print("Calor: 20°")
	#else:
		#print("Frio: abaixo dos 18°")


func _on_timer_timeout():
	calor_atual = _equilibrador()
	calor_bar.value = calor_atual
	
	chuva_atual = _equilibrador()
	chuva_bar.value = chuva_atual
