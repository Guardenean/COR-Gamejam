extends ColorRect

@onready var chuva = $"../Medidores/VBoxContainer/ProgressBar"
@onready var calor = $"../Medidores/VBoxContainer/IndicaCalor"
@onready var estagio = $estagioNivel

func _process(_delta: float) -> void:
	
	var indice_chuva = chuva.chuva_atual
	var indice_calor = calor.calor_atual
	var calculo = (indice_calor + indice_chuva + Desastres.peso_estagio) / 3
	
	_mede_estagio(calculo)


func _mede_estagio(calculo: float):
	
	if calculo >= 90:
		estagio.text = "5"
		color = Color(0.5, 0, 0.5)  # Roxo
	elif calculo >= 70:
		estagio.text = "4"
		color = Color(1, 0, 0)  # Vermelho
	elif calculo >= 50:
		estagio.text = "3"
		color = Color(1, 0.5, 0)  # Laranja
	elif calculo >= 30:
		estagio.text = "2"
		color = Color(1, 1, 0)  # Amarelo
	else:
		estagio.text = "1"
		color = Color(0, 1, 0)  # Verde
