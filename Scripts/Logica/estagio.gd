extends ColorRect

@onready var principal = $"../.."
#@onready var chuva = $"../Medidores/VBoxContainer/ProgressBar"
#@onready var calor = $"../Medidores/VBoxContainer/IndicaCalor"
@onready var medidores = $"../Medidores"
@onready var estagio_label = $estagioNivel
var estagio

# VARIÁVEIS DE COR PARA TELA DE ESTÁGIO
@export var color_1 : Color
@export var color_2 : Color
@export var color_3 : Color
@export var color_4 : Color
@export var color_5 : Color

func _process(_delta: float) -> void:
	var indice_chuva = medidores.chuva_atual#chuva.chuva_atual
	var indice_calor = medidores.calor_atual#calor.calor_atual
	var calculo = (indice_calor + indice_chuva + Desastres.peso_estagio) / 3
	
	_mede_estagio(calculo)

func _mede_estagio(calculo: float):
	if calculo >= 90:
		estagio = 5
		color = color_5 #Color(0.5, 0, 0.5)  # Roxo
	elif calculo >= 70:
		estagio = 4
		color = color_4 #Color(1, 0, 0)  # Vermelho
	elif calculo >= 50:
		estagio = 3
		color = color_3 #Color(1, 0.5, 0)  # Laranja
	elif calculo >= 30:
		estagio = 2
		color = color_2 #Color(1, 1, 0)  # Amarelo
	else:
		estagio = 1
		color = color_1 #Color(0, 1, 0)  # Verde
	
	estagio_label.text = str(estagio)
	
	#if calculo >= 90:
		#estagio.text = "5"
		#color = color_5 #Color(0.5, 0, 0.5)  # Roxo
	#elif calculo >= 70:
		#estagio.text = "4"
		#color = color_4 #Color(1, 0, 0)  # Vermelho
	#elif calculo >= 50:
		#estagio.text = "3"
		#color = color_3 #Color(1, 0.5, 0)  # Laranja
	#elif calculo >= 30:
		#estagio.text = "2"
		#color = color_2 #Color(1, 1, 0)  # Amarelo
	#else:
		#estagio.text = "1"
		#color = color_1 #Color(0, 1, 0)  # Verde


func _on_tempo_jogo_timeout():
	if estagio >= 4:
		get_tree().change_scene_to_file("res://Cenas/Menu/Derrota.tscn")
	else:
		get_tree().change_scene_to_file("res://Cenas/Menu/Vitoria.tscn")
