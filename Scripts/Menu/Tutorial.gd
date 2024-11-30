extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Aprentação Jogo".visible = true
	$"Orgãos Jogo".visible = false
	$"Mecânica Jogo".visible = false

func _on_prox_1_pressed() -> void:
	$"Aprentação Jogo".visible = false
	$"Orgãos Jogo".visible = true
	$"Mecânica Jogo".visible = false


func _on_ant_1_pressed() -> void:
	$"Aprentação Jogo".visible = true
	$"Orgãos Jogo".visible = false
	$"Mecânica Jogo".visible = false


func _on_prox_2_pressed() -> void:
	$"Aprentação Jogo".visible = false
	$"Orgãos Jogo".visible = false
	$"Mecânica Jogo".visible = true

func _on_ant_2_pressed() -> void:
	$"Aprentação Jogo".visible = false
	$"Orgãos Jogo".visible = true
	$"Mecânica Jogo".visible = false


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Menu/Inicio.tscn")
