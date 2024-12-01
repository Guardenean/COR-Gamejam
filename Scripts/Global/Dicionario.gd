extends Node

var id_count = 0 # CONTADOR PARA SETAR ID DE OCORRÊNCIAS
var peso_estagio = 0 # PESO TOTAL PARA CÁLCULO DO ESTÁGIO DA CIDADE

const desastres = { # DADOS DE DESASTRES
	0: {
		"nome": "Acidente",
		"desc": "Carros se chocaram", 
		"peso": "1",
		"orgaos": ["pm", "samu", "cet_rio"],
		"img" : "acidente"
	},
	1: {
		"nome": "Chuva Fraca",
		"desc": "Chuva ultrapassou os 10mm/h",
		"peso": "1",
		"orgaos": ["alerta_rio", "conservacao"],
		"img" : "acidente"
	},
	2: {
		"nome": "Chuva Moderada",
		"desc": "Chuva ultrapassou os 20mm/h",
		"peso": "2",
		"orgaos": ["alerta_rio", "conservacao", "rioaguas"],
		"img" : "acidente"
	},
	3: {
		"nome": "Chuva Forte",
		"desc": "Chuva ultrapassou os 30mm/h",
		"peso": "3",
		"orgaos": ["alerta_rio", "geo_rio", "conservacao"],
		"img" : "acidente"
	},
	4: {
		"nome": "Evento",
		"desc": "Final do Jogo de futebol",
		"peso": "2",
		"orgaos": ["cet_rio", "pm"],
		"img" : "acidente"
	},
	5: {
		"nome": "Grande Evento",
		"desc": "Show de artista vindo de fora",
		"peso": "4",
		"orgaos": ["cet_rio", "pm", "conservacao"],
		"img" : "acidente"
	},
	6: {
		"nome": "Queda de árvore",
		"desc": "Árvore em queda de residência",
		"peso": "1",
		"orgaos": ["conservacao", "bombeiro"],
		"img" : "acidente"
	},
	7: {
		"nome": "Queda de árvore em uma moradia",
		"desc": "Árvore em queda de fios de eletricidade",
		"peso": "2",
		"orgaos": ["conservacao", "bombeiro", "rioluz"],
		"img" : "acidente"
	},
	8: {
		"nome": "Maré Alta",
		"desc": "Altos índices no marégrafo",
		"peso": "2",
		"orgaos": ["alerta_rio", "geo_rio"],
		"img" : "acidente"
	},
	9: {
		"nome": "Colapso de Prédio",
		"desc": "Prédio desabou",
		"peso": "4",
		"orgaos": ["bombeiro", "geo_rio", "pm"],
		"img" : "acidente"
	},
	10: {
		"nome": "Deslizamento de Terra",
		"desc": "Terra gerou escombros arrastando área",
		"peso": "3",
		"orgaos": ["bombeiro", "geo_rio", "alerta_rio"],
		"img" : "acidente"
	},
	11: {
		"nome": "Incêndio Urbano",
		"desc": "Fogo se alastrando sobre prédio",
		"peso": "4",
		"orgaos": ["bombeiro", "pm", "conservacao"],
		"img" : "acidente"
	},
	12: {
		"nome": "Rompimento de tubulação",
		"desc": "Cano explodiu, jogando água na rua",
		"peso": "2",
		"orgaos": ["rioaguas", "conservacao"],
		"img" : "acidente"
	},
	13: {
		"nome": "Falha de transporte público",
		"desc": "Ônibus com falha ao meio da pista",
		"peso": "3",
		"orgaos": ["cet_rio", "pm"],
		"img" : "acidente"
	},
	14: {
		"nome": "Queda de árvore em veículo",
		"desc": "Queda em carro de família, chance de haver feridos",
		"peso": "3",
		"orgaos": ["bombeiro", "conservacao", "samu"],
		"img" : "acidente"
	},
	15: {
		"nome": "Lixo Acumulado Baixo",
		"desc": "Acúmulo de moscas na região",
		"peso": "1",
		"orgaos": ["comlurb"],
		"img" : "acidente"
	},
	16: {
		"nome": "Lixo Acumulado Grave",
		"desc": "Acúmulo de mosquitos em grande escala",
		"peso": "3",
		"orgaos": ["comlurb", "conservacao"],
		"img" : "acidente"
	},
	17: {
		"nome": "Onda de calor intensa",
		"desc": "Seca em regiões e grande onda de mormaço",
		"peso": "3",
		"orgaos": ["alerta_rio", "conservacao"],
		"img" : "acidente"
	},
	18: {
		"nome": "Queda de luz Baixa",
		"desc": "Região residencial sem energia",
		"peso": "1",
		"orgaos": ["rioluz"],
		"img" : "acidente"
	},
	19: {
		"nome": "Queda de luz Moderada",
		"desc": "Região de sinais sem energia",
		"peso": "2",
		"orgaos": ["rioluz", "cet_rio"],
		"img" : "acidente"
	},
	20: {
		"nome": "Queda de luz Grave",
		"desc": "Região de hospitais sem energia",
		"peso": "4",
		"orgaos": ["rioluz", "pm", "samu"],
		"img" : "acidente"
	},
	21: {
		"nome": "Seca em área residencial",
		"desc": "Falta d'água em região residencial",
		"peso": "2",
		"orgaos": ["rioaguas", "conservacao"],
		"img" : "acidente"
	},
	22: {
		"nome": "Interditamento de passagem de esgoto",
		"desc": "Acúmulo de sujeira nas tubulações",
		"peso": "3",
		"orgaos": ["rioaguas", "conservacao"],
		"img" : "acidente"
	},
	23: {
		"nome": "Enchente Urbana",
		"desc": "Áreas urbanas inundadas por excesso de chuva",
		"peso": "4",
		"orgaos": ["rioaguas", "geo_rio", "alerta_rio", "conservacao"],
		"img" : "acidente"
	},
	24: {
		"nome": "Buraco na pista",
		"desc": "Formação de cratera em via pública",
		"peso": "2",
		"orgaos": ["conservacao", "cet_rio"],
		"img" : "acidente"
	},
	25: {
		"nome": "Derramamento de óleo",
		"desc": "Acidente causando óleo em vias públicas",
		"peso": "3",
		"orgaos": ["cet_rio", "conservacao"],
		"img" : "acidente"
	},
	26: {
		"nome": "Desabamento de muro",
		"desc": "Muro de contenção desabou",
		"peso": "3",
		"orgaos": ["geo_rio", "conservacao", "bombeiro"],
		"img" : "acidente"
	},
	27: {
		"nome": "Ameaça de bomba",
		"desc": "Suspeita de dispositivo explosivo em área urbana",
		"peso": "5",
		"orgaos": ["pm", "bombeiro"],
		"img" : "acidente"
	},
	28: {
		"nome": "Rompimento de barragem",
		"desc": "Barragem se rompeu, liberando grande volume de água",
		"peso": "5",
		"orgaos": ["geo_rio", "rioaguas", "bombeiro", "pm"],
		"img" : "acidente"
	},
	29: {
		"nome": "Protesto em vias públicas",
		"desc": "Manifestação interrompendo o tráfego",
		"peso": "2",
		"orgaos": ["pm", "cet_rio"],
		"img" : "acidente"
	},
	30: {
		"nome": "Incêndio florestal",
		"desc": "Fogo alastrando em área de mata",
		"peso": "4",
		"orgaos": ["bombeiro", "alerta_rio"],
		"img" : "acidente"
	},
	31: {
		"nome": "Desmoronamento de ponte",
		"desc": "Estrutura de ponte colapsou",
		"peso": "5",
		"orgaos": ["bombeiro", "cet_rio", "geo_rio"],
		"img" : "acidente"
	},
	32: {
		"nome": "Vazamento químico",
		"desc": "Substância perigosa vazando em área industrial",
		"peso": "5",
		"orgaos": ["bombeiro", "pm", "conservacao"],
		"img" : "acidente"
	},
	33: {
		"nome": "Ataque de animais selvagens",
		"desc": "Animais silvestres em área urbana causando perigo. 4 feridos no local, com risco de aumento no número de vítimas",
		"peso": "3",
		"orgaos": ["pm", "conservacao", "samu"],
		"img" : "acidente"
	},
	34: {
		"nome": "Colisão ferroviária",
		"desc": "Trens colidiram, causando danos e possíveis vítimas",
		"peso": "5",
		"orgaos": ["cet_rio", "bombeiro", "samu"],
		"img" : "acidente"
	},
	35: {
		"nome": "Desabamento em obra",
		"desc": "Estruturas colapsaram em área de construção",
		"peso": "4",
		"orgaos": ["geo_rio", "bombeiro"],
		"img" : "acidente"
	}
}

func seleciona_desastre():
	var d = randi_range(0, desastres.size() - 1)
	var result = desastres[d]
	return result
