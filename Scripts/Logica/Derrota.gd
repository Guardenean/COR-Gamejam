extends Control

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Menu/Inicio.tscn")


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Game/Principal.tscn")
