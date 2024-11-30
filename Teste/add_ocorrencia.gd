extends Control

const ocor = preload("res://Teste/Ocorrencia.tscn")
@onready var box = $VBoxContainer

func _on_add_pressed():
	var o = ocor.instantiate()
	box.add_child(o)

func _ready():
	_1.visible = true
	_2.visible = false
	_3.visible = false

@onready var _1 = $"Telas/1"
@onready var _2 = $"Telas/2"
@onready var _3 = $"Telas/3"


func _on_prox_1_pressed():
	_1.visible = false
	_2.visible = true
	_3.visible = false


func _on_ant_2_pressed():
	_1.visible = true
	_2.visible = false
	_3.visible = false


func _on_prox_2_pressed():
	_1.visible = false
	_2.visible = false
	_3.visible = true


func _on_ant_3_pressed():
	_1.visible = false
	_2.visible = true
	_3.visible = false
