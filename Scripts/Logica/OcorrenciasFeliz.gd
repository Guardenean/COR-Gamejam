extends Node

const ocor = preload("res://Cenas/Objetos/BtnOcorrencias.tscn")
@onready var box = $VBoxContainer
@onready var timer = $Timer

#@export var min_ocor = 1
@export var max_ocor = 4
@export var intervalo_min = 0.0#20.0
@export var intervalo_max = 2.0#40.0

func _ready() -> void:
	timer.wait_time = randf_range(intervalo_min, intervalo_max)
	print(timer.wait_time)

func _on_timer_timeout() -> void:
	# Verifica se já atingiu o limite de botões
	if box.get_child_count() >= max_ocor:
		return
	
	# Cria e adiciona o botão
	var btn_ocorrencias = ocor.instantiate()
	box.add_child(btn_ocorrencias)
	
	## Configura um Timer para remover o botão após 20 segundos
	#var removal_timer = Timer.new()
	#btn_ocorrencias.add_child(removal_timer)
	#removal_timer.one_shot = true
	#removal_timer.wait_time = 20.0
	#removal_timer.timeout.connect(func() -> void:
		#if btn_ocorrencias:
			#btn_ocorrencias.queue_free()
	#)
	#removal_timer.start()
