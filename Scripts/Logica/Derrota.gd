extends Control

@onready var mensagem = $Panel/Mensagem
@onready var anim = $AnimationPlayer
@onready var media_txt = $Panel/Media

var control = true

@export var color_win : Color
@export var color_fail : Color

var texto_win := "A CIDADE ESTÁ EM ORDEM"
var texto_fail := "VOCÊ FALHOU COM A CIDADE"

func _ready():
	mensagem.visible_characters = 0
	match Desastres.win:
		false:
			mensagem.text = texto_fail
			mensagem.label_settings.font_color = color_fail
		true:
			mensagem.text = texto_win
			mensagem.label_settings.font_color = color_win
	
	calcula_media()

func calcula_media():
	if Desastres.num_ocor <= 0:
		media_txt.text = "Você sequer tentou?"
	else:
		var media : float = round(Desastres.soma_tempo_react) / Desastres.num_ocor
		media_txt.text = "Média de Tempo de Resposta: " + str(media)

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Menu/Inicio.tscn")

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Game/Principal.tscn")

func _on_timer_timeout():
	var total = mensagem.get_total_character_count()
	if mensagem.visible_characters < total:
		mensagem.visible_characters += 1
	elif control:
		control = false
		anim.play("fade_in")
