extends TextureButton

var desaster
var game
var area_des
var area_nome
var principal
var peso
var tempo_react = 0
@onready var label = $Label
@onready var bar = $ProgressBar
@onready var timer = $Timer
@onready var sfx = $SFX

func _ready() -> void:
	# SETA O ID
	name = "Ocor" + str(Desastres.id_count)
	Desastres.id_count += 1
	
	# INICIA VARIÁVEIS
	principal = get_tree().current_scene
	area_des = get_tree().current_scene.find_child("Desc")
	area_nome = get_tree().current_scene.find_child("Nome")
	
	# ESCOLHE UM DESASTRE
	desaster = Desastres.seleciona_desastre()
	
	# RECEBE O PESO
	peso = desaster.peso.to_int()
	Desastres.peso_estagio += peso
	print(Desastres.peso_estagio)
	
	# SETA O NOME DO BOTÃO
	label.text = desaster.nome

func _process(delta):
	# MOVE VALOR DA BARRA QUANDO ANALISANDO
	if !timer.is_stopped():
		bar.value = (1 - (timer.time_left / timer.wait_time)) * 100
	else: bar.value = 0
	
	# ARMAZENA TEMPO DE EXISTÊNCIA
	tempo_react += delta

func _on_pressed() -> void:
	# SETA O MONITOR DE IMAGEM
	principal.monitor_l.muda_imagem(desaster.img)
	
	# SETA O TEXTO NO MONITOR DE DESCRIÇÃO
	area_nome.text = desaster.nome
	area_des.text = desaster.desc
	
	# REGISTRA COMO SELECIONADO
	principal.ocor_node = self
	
	# TOCA SFX
	sfx.stream = preload("res://Assets/SFX/Select.wav")
	sfx.play()

func resolve(orgaos : Array) -> void:
	sfx.stream = preload("res://Assets/SFX/Analisando.MP3")
	sfx.play()
	timer.start() # INICIA O TIMER
	await timer.timeout # ESPERA TIMER TERMINAR
	sfx.stop()
	
	# CHECA SE O NÚMERO DE ÓRGAOS É CERTO
	if orgaos.size() == desaster.orgaos.size():
		var count = 0
		# CHECA O NOME DOS ÓRGÃOS
		for i in orgaos:
			if desaster.orgaos.has(i):
				count += 1
		
		# SE O CONTADOR BATER, SUCESSO
		if count >= orgaos.size():
			print("Sucesso!")
			Desastres.peso_estagio -= peso
			Desastres.num_ocor += 1
			#Desastres.soma_tempo_react += 0
			principal.ocor_node = null
			sfx.stream = preload("res://Assets/SFX/Success.wav")
			sfx.play()
			queue_free()
			
	# SENÃO, FRACASSO E AUMENTA PESO DE ESTÁGIO
		else:
			print("Falhou...")
			Desastres.peso_estagio += 1
			print(Desastres.peso_estagio)
			sfx.stream = preload("res://Assets/SFX/Fail.wav")
			sfx.play()
	else:
		print("Falhou...")
		Desastres.peso_estagio += 1
		print(Desastres.peso_estagio)
		sfx.stream = preload("res://Assets/SFX/Fail.wav")
		sfx.play()
