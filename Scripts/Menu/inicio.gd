extends Control

@onready var sfx = $SFX
@onready var timer = $Timer

func _on_jogar_pressed() -> void: #Entra no jojinho
	timer.start()
	sfx.play()
	await timer.timeout
	get_tree().change_scene_to_file("res://Cenas/Game/Principal.tscn")

func _on_tutorial_pressed() -> void: # TUTORIAL DO JOJINHO
	timer.start()
	sfx.play()
	await timer.timeout
	get_tree().change_scene_to_file("res://Cenas/Menu/NeoTutorial.tscn")
	
func _on_sair_pressed() -> void:  #Sai do jojinho
	timer.start()
	sfx.play()
	await timer.timeout
	get_tree().quit()
