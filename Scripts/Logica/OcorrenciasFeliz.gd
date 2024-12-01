extends Node

const ocor = preload("res://Cenas/Objetos/BtnOcorrencias.tscn")
@onready var box = $VBoxContainer
@onready var timer = $Timer

@export var max_ocor = 4
@export var intervalo_min = 0.0#20.0
@export var intervalo_max = 2.0#40.0

func _ready() -> void:
	#timer.wait_time = randf_range(intervalo_min, intervalo_max)
	altera_espera()
	print(timer.wait_time)

func _on_timer_timeout() -> void:
	# Verifica se já atingiu o limite de botões
	if box.get_child_count() >= max_ocor:
		return
	
	# Cria e adiciona o botão
	var btn_ocorrencias = ocor.instantiate()
	box.add_child(btn_ocorrencias)
	
	altera_espera()

func altera_espera(): # ALTERA O TEMPO DE SPAWN
	timer.wait_time = randf_range(intervalo_min, intervalo_max)
