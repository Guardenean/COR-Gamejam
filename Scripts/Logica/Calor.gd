extends Node

@export var min_value: float = 0.0
@export var max_value: float = 100.0
@export var update_interval: float = 10.0

var time_elapsed: float = 0.0
var progress_bar: ProgressBar

# Variável para armazenar o valor atual do calor
var calor_atual: float = 0.0

func _ready():
	progress_bar = $"."  # Certifique-se de que o nome do nó está correto
	progress_bar.min_value = min_value
	progress_bar.max_value = max_value

func _process(delta: float):
	time_elapsed += delta
	if time_elapsed >= update_interval:
		# Gera e atualiza o valor da barra
		calor_atual = _equilibrador()  # Armazena o valor gerado
		progress_bar.value = calor_atual
		_mede_calor(calor_atual)  # Passa o valor armazenado para a função
		time_elapsed = 0.0

func _equilibrador() -> float:
	var random = randi() % 100  # Gera um número entre 0 e 99
	if random < 70:  # 70% de chance de estar até 50%
		return randf_range(min_value, max_value / 2)
	else:  # 30% de chance de estar entre 50% e 100%
		return randf_range(max_value / 2, max_value)

func _mede_calor(valueC: float):
	# Atualiza o calor atual
	calor_atual = valueC
	
	if valueC >= 90:
		print("O Mundo está em chamas: 40°")
	elif valueC >= 70:
		print("Onda forte de calor: 28°")
	elif valueC >= 50:
		print("Está Calor: 25°")
	elif valueC >= 30:
		print("Calor: 20°")
	else:
		print("Frio: abaixo dos 18°")

# Função para obter o valor armazenado
func get_calor_atual() -> float:
	return calor_atual
