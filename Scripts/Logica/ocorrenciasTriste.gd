extends Node

const ocor = preload("res://Cenas/Objetos/BtnOcorrencias.tscn")
@onready var box: VBoxContainer = $containerOcorrencias

var min_ocor = 1
var max_ocor = 5
var intervalo_min = 20.0
var intervalo_max = 40.0


func _ready():
	_start_gerador()
	

func _start_gerador():
	var gerador_timer = Timer.new()
	add_child(gerador_timer)
	gerador_timer.one_shot = false
	gerador_timer.wait_time = randf_range(intervalo_min, intervalo_max)
	gerador_timer.timeout.connect(_on_timer_timeout)
	gerador_timer.start()

func _on_timer_timeout() -> void:
	# Verifica se já atingiu o limite de botões
	if box.get_child_count() >= max_ocor:
		return
	
	# Cria e adiciona o botão
	var btn_ocorrencias = ocor.instantiate()
	box.add_child(btn_ocorrencias)
	
	# Configura um Timer para remover o botão após 20 segundos
	var removal_timer = Timer.new()
	btn_ocorrencias.add_child(removal_timer)
	removal_timer.one_shot = true
	removal_timer.wait_time = 20.0
	removal_timer.timeout.connect(func() -> void:
		if btn_ocorrencias:
			btn_ocorrencias.queue_free()
	)
	removal_timer.start()
