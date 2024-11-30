extends TextureButton

var desaster
var game
var area_des
var area_nome
var principal
var peso
@onready var label = $Label

func _ready():
	name = "Ocor" + str(Desastres.id_count)
	Desastres.id_count += 1
	
	principal = get_tree().current_scene
	area_des = get_tree().current_scene.find_child("Desc")
	area_nome = get_tree().current_scene.find_child("Nome")
	
	desaster = Desastres.seleciona_desastre()
	
	peso = desaster.peso.to_int()
	label.text = desaster.nome

func _on_pressed():
	# SETA O TEXTO NO MONITOR DE DESCRIÇÃO
	area_nome.text = desaster.nome
	area_des.text = desaster.desc
	
	# REGISTRA COMO SELECIONADO
	principal.ocor_node = self
	print(name)

func resolve(orgaos):
	$Timer.start()
	await $Timer.timeout
	if orgaos.size() == desaster.orgaos.size():
		print("Sucesso!")
		Desastres.peso_estagio -= peso
		queue_free()
	else:
		print("Falhou...")
		peso += 1
