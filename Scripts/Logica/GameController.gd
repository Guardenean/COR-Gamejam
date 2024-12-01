extends Control

var ocor_node : Control

@onready var tempo_jogo = $TempoJogo
var ocor_selection = []

@onready var monitor_l = $Mesa/MonitorL
@onready var grid_recursos = $Recursos/Orgaos/GridContainer

# LISTA DE RECURSOS SELECIONADOS PARA ENVIO
var selected = {
	"defesa_civil" : [false, preload("res://Assets/SpritesPrincipais/Icones/DefesaCivil.png"),
		preload("res://Assets/SpritesPrincipais/Icones/DefesaCivilNO.png")],
		
	"comlurb" : [false, preload("res://Assets/SpritesPrincipais/Icones/Comlurb.png"),
		preload("res://Assets/SpritesPrincipais/Icones/ComlurbNO.png")],
		
	"samu" : [false, preload("res://Assets/SpritesPrincipais/Icones/SAMU.png"),
		preload("res://Assets/SpritesPrincipais/Icones/SAMUNO.png")],
		
	"bombeiro" : [false, preload("res://Assets/SpritesPrincipais/Icones/Bombeiro.png"),
		preload("res://Assets/SpritesPrincipais/Icones/BombeiroNO.png")],
		
	"pm" : [false, preload("res://Assets/SpritesPrincipais/Icones/PoliciaMilitar.png"),
		preload("res://Assets/SpritesPrincipais/Icones/PoliciaMilitarNO.png")],
		
	"alerta_rio" : [false, preload("res://Assets/SpritesPrincipais/Icones/AlertaRio.png"),
		preload("res://Assets/SpritesPrincipais/Icones/AlertaRioNO.png")],
		
	"geo_rio" : [false, preload("res://Assets/SpritesPrincipais/Icones/GeoRio.png"),
		preload("res://Assets/SpritesPrincipais/Icones/GeoRioNO.png")],
		
	"rioluz" : [false, preload("res://Assets/SpritesPrincipais/Icones/RioLuz.png"),
		preload("res://Assets/SpritesPrincipais/Icones/RioLuzNO.png")],
		
	"rioaguas" : [false, preload("res://Assets/SpritesPrincipais/Icones/RioAguas.png"),
		preload("res://Assets/SpritesPrincipais/Icones/RioAguasNO.png")],
		
	"cet_rio" : [false, preload("res://Assets/SpritesPrincipais/Icones/CetRio.png"),
		preload("res://Assets/SpritesPrincipais/Icones/CetRioNO.png")],
		
	"conservacao" : [false, preload("res://Assets/SpritesPrincipais/Icones/Conservacao.png"),
		preload("res://Assets/SpritesPrincipais/Icones/ConservacaoNO.png")],
}

func _ready():
	reseta_imagens()

func reseta_imagens():
	var c = 0
	for s in selected:
		var r = grid_recursos.get_child(c)
		r.texture_normal = selected[s][2]
		c += 1

#region RECURSOS
# CHECAGEM AO CLICAR EM RECURSO
func check_selected(id):
	match selected[id][0]:
		false: # SE FOR FALSO, MARCA COMO SELECIONADO E ADICIONA À LISTA DE ENVIO
			selected[id][0] = true
			ocor_selection.append(id)
			print(ocor_selection)
			return true
		true: # SE FOR VERDADEIRO, CANCELA TUDO
			selected[id][0] = false
			ocor_selection.erase(id)
			print(ocor_selection)
			return false

# FUNÇÕES ON CLICK ABAIXO
func _on_defesa_civil_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("defesa_civil")
	var b = get_node("Recursos/Orgaos/GridContainer/DefesaCivil")
	match r:
		true:
			b.texture_normal = selected["defesa_civil"][1]
		false:
			b.texture_normal = selected["defesa_civil"][2]

func _on_comlurb_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("comlurb")
	var b = get_node("Recursos/Orgaos/GridContainer/Comlurb")
	match r:
		true:
			b.texture_normal = selected["comlurb"][1]
		false:
			b.texture_normal = selected["comlurb"][2]

func _on_samu_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("samu")
	var b = get_node("Recursos/Orgaos/GridContainer/Samu")
	match r:
		true:
			b.texture_normal = selected["samu"][1]
		false:
			b.texture_normal = selected["samu"][2]

func _on_bombeiro_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("bombeiro")
	var b = get_node("Recursos/Orgaos/GridContainer/Bombeiro")
	match r:
		true:
			b.texture_normal = selected["bombeiro"][1]
		false:
			b.texture_normal = selected["bombeiro"][2]

func _on_policia_militar_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("pm")
	var b = get_node("Recursos/Orgaos/GridContainer/PoliciaMilitar")
	match r:
		true:
			b.texture_normal = selected["pm"][1]
		false:
			b.texture_normal = selected["pm"][2]

func _on_alerta_rio_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("alerta_rio")
	var b = get_node("Recursos/Orgaos/GridContainer/AlertaRio")
	match r:
		true:
			b.texture_normal = selected["alerta_rio"][1]
		false:
			b.texture_normal = selected["alerta_rio"][2]

func _on_geo_rio_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("geo_rio")
	var b = get_node("Recursos/Orgaos/GridContainer/GeoRio")
	match r:
		true:
			b.texture_normal = selected["geo_rio"][1]
		false:
			b.texture_normal = selected["geo_rio"][2]

func _on_rio_luz_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("rioluz")
	var b = get_node("Recursos/Orgaos/GridContainer/RioLuz")
	match r:
		true:
			b.texture_normal = selected["rioluz"][1]
		false:
			b.texture_normal = selected["rioluz"][2]

func _on_rio_aguas_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("rioaguas")
	var b = get_node("Recursos/Orgaos/GridContainer/RioAguas")
	match r:
		true:
			b.texture_normal = selected["rioaguas"][1]
		false:
			b.texture_normal = selected["rioaguas"][2]

func _on_cet_rio_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("cet_rio")
	var b = get_node("Recursos/Orgaos/GridContainer/CetRio")
	match r:
		true:
			b.texture_normal = selected["cet_rio"][1]
		false:
			b.texture_normal = selected["cet_rio"][2]

func _on_conservacao_pressed() -> void:
	if ocor_node == null: return
	var r = check_selected("conservacao")
	var b = get_node("Recursos/Orgaos/GridContainer/Conservacao")
	match r:
		true:
			b.texture_normal = selected["conservacao"][1]
		false:
			b.texture_normal = selected["conservacao"][2]

func _on_enviar_pressed() -> void:
	if ocor_node == null: return
	# ENVIA DADOS PARA SEREM ANALISADOS
	ocor_node.resolve(ocor_selection)
	
	# RESETA RECURSOS SELECIONADOS
	for i in selected:
		if selected[i][0] == true:
			selected[i][0] = false
	reseta_imagens()
	ocor_selection = []
#endregion
