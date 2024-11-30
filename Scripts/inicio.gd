extends Control

func _on_jogar_pressed() -> void: #Entra no jojinho
	get_tree().change_scene_to_file("res://Cenas/Principal.tscn")

func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Cenas/Tutorial.tscn")
	
func _on_sair_pressed() -> void:  #Sai do jojinho
	get_tree().quit()
