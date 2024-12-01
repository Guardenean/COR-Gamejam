extends Node

@export var min_value: float = 0.0
@export var max_value: float = 100.0
@export var update_interval: float = 10.0

var time_elapsed: float = 0.0
var progress_bar: ProgressBar

# Variável para armazenar o valor atual da chuva
var chuva_atual: float = 0.0

func _ready():
	progress_bar = $"."  # Certifique-se de que o nome do nó está correto
	progress_bar.min_value = min_value
	progress_bar.max_value = max_value

func _process(delta: float):
	time_elapsed += delta
	if time_elapsed >= update_interval:
		# Gera e atualiza o valor da barra
		chuva_atual = _equilibrador()  # Armazena o valor gerado
		progress_bar.value = chuva_atual
		#_mede_chuva(chuva_atual)  # Passa o valor armazenado para a função
		time_elapsed = 0.0

func _equilibrador() -> float:
	var random = randi() % 100  # Gera um número entre 0 e 99
	if random < 70:  # 70% de chance de estar até 50%
		return randf_range(min_value, max_value / 2)
	else:  # 30% de chance de estar entre 50% e 100%
		return randf_range(max_value / 2, max_value)

func _mede_chuva(valueChuva: float):
	# Armazena a última medida de chuva
	chuva_atual = valueChuva
	
	#if valueChuva >= 90:
		#print("O MUNDO VAI CAAAAIIR! Estimativa: 150mm")
	#elif valueChuva >= 70:
		#print("chuvinha foite! Estimativa: 100mm")
	#elif valueChuva >= 50:
		#print("Chuva mediana! Estimativa: 50mm")
	#elif valueChuva >= 30:
		#print("Chuva goitosa! Estimativa: 20mm")
	#else:
		#print("sem chuva ;-;. Estimativa: 0mm")

# Função para obter o valor armazenado
func get_chuva_atual() -> float:
	return chuva_atual
