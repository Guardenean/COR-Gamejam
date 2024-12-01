extends Control

var ocor_node : Control

@onready var tempo_jogo = $TempoJogo
var ocor_selection = []

@onready var monitor_l = $Mesa/MonitorL

# LISTA DE RECURSOS SELECIONADOS PARA ENVIO
var selected = {
	"defesa_civil" : false,
	"comlurb" : false,
	"samu" : false,
	"bombeiro" : false,
	"pm" : false,
	"alerta_rio" : false,
	"geo_rio" : false,
	"rioluz" : false,
	"rioaguas" : false,
	"cet_rio" : false,
	"conservacao" : false
}

#region RECURSOS
# CHECAGEM AO CLICAR EM RECURSO
func check_selected(id) -> void:
	match selected[id]:
		false: # SE FOR FALSO, MARCA COMO SELECIONADO E ADICIONA À LISTA DE ENVIO
			selected[id] = true
			ocor_selection.append(id)
			print(ocor_selection)
		true: # SE FOR VERDADEIRO, CANCELA TUDO
			selected[id] = false
			ocor_selection.erase(id)
			print(ocor_selection)

# FUNÇÕES ON CLICK ABAIXO
func _on_defesa_civil_pressed() -> void:
	check_selected("defesa_civil")

func _on_comlurb_pressed() -> void:
	check_selected("comlurb")

func _on_samu_pressed() -> void:
	check_selected("samu")

func _on_bombeiro_pressed() -> void:
	check_selected("bombeiro")

func _on_policia_militar_pressed() -> void:
	check_selected("pm")

func _on_alerta_rio_pressed() -> void:
	check_selected("alerta_rio")

func _on_geo_rio_pressed() -> void:
	check_selected("geo_rio")

func _on_rio_luz_pressed() -> void:
	check_selected("rioluz")

func _on_rio_aguas_pressed() -> void:
	check_selected("rioaguas")

func _on_cet_rio_pressed() -> void:
	check_selected("cet_rio")

func _on_conservacao_pressed() -> void:
	check_selected("conservacao")

func _on_enviar_pressed() -> void:
	if ocor_node == null: return
	# ENVIA DADOS PARA SEREM ANALISADOS
	ocor_node.resolve(ocor_selection)
	
	# RESETA RECURSOS SELECIONADOS
	for i in selected:
		if selected[i] == true:
			print(i + " é verdadeiro")
			selected[i] = false
		
	ocor_selection = []
#endregion
