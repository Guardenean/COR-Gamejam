extends Button

var desaster
var area_des


func _ready():
	area_des = get_tree().current_scene.find_child("Desc")
	desaster = Desastres.seleciona_desastre()
	text = desaster.nome

func _on_pressed():
	area_des.text = desaster.desc
