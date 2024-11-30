extends Node

const desastres = {
	0: {
		"nome": "Acidente",
		"desc": "Carros se chocaram", 
		"peso": "1",
		"orgaos": ["Policia militar", "SAMU", "CET Rio"]
	},
	1: {
		"nome": "Chuva Fraca",
		"desc": "Chuva ultrapassou os 10mm/h",
		"peso": "1",
		"orgaos": ["Alerta Rio", "Conservação"]
	},
	2: {
		"nome": "Chuva Moderada",
		"desc": "Chuva ultrapassou os 20mm/h",
		"peso": "2",
		"orgaos": ["Alerta Rio", "Conservação", "Rio Aguas"]
	},
	3: {
		"nome": "Chuva Forte",
		"desc": "Chuva ultrapassou os 30mm/h",
		"peso": "3",
		"orgaos": ["Alerta Rio", "Geo Rio", "Conservação"]
	},
	4: {
		"nome": "Evento",
		"desc": "Final do Jogo de futebol",
		"peso": "2",
		"orgaos": ["CET Rio", "Policia militar"]
	},
	5: {
		"nome": "Grande Evento",
		"desc": "Show de artista vindo de fora",
		"peso": "4",
		"orgaos": ["CET Rio", "Policia militar", "Conservação"]
	},
	6: {
		"nome": "Queda de árvore",
		"desc": "Árvore em queda de residência",
		"peso": "1",
		"orgaos": ["Conservação", "Bombeiro"]
	},
	7: {
		"nome": "Queda de árvore em uma moradia",
		"desc": "Árvore em queda de fios de eletricidade",
		"peso": "2",
		"orgaos": ["Conservação", "Bombeiro", "Rio Luz"]
	},
	8: {
		"nome": "Maré Alta",
		"desc": "Altos índices no marégrafo",
		"peso": "2",
		"orgaos": ["Alerta Rio", "Geo Rio"]
	},
	9: {
		"nome": "Colapso de Prédio",
		"desc": "Prédio desabou",
		"peso": "4",
		"orgaos": ["Bombeiro", "Geo Rio", "Policia militar"]
	},
	10: {
		"nome": "Deslizamento de Terra",
		"desc": "Terra gerou escombros arrastando área",
		"peso": "3",
		"orgaos": ["Bombeiro", "Geo Rio", "Alerta Rio"]
	},
	11: {
		"nome": "Incêndio Urbano",
		"desc": "Fogo se alastrando sobre prédio",
		"peso": "4",
		"orgaos": ["Bombeiro", "Policia militar", "Conservação"]
	},
	12: {
		"nome": "Rompimento de tubulação",
		"desc": "Cano explodiu, jogando água na rua",
		"peso": "2",
		"orgaos": ["Rio Aguas", "Conservação"]
	},
	13: {
		"nome": "Falha de transporte público",
		"desc": "Ônibus com falha ao meio da pista",
		"peso": "3",
		"orgaos": ["CET Rio", "Policia militar"]
	},
	14: {
		"nome": "Queda de árvore em veículo",
		"desc": "Queda em carro de família, chance de haver feridos",
		"peso": "3",
		"orgaos": ["Bombeiro", "Conservação", "SAMU"]
	},
	15: {
		"nome": "Lixo Acumulado Baixo",
		"desc": "Acúmulo de moscas na região",
		"peso": "1",
		"orgaos": ["Comlurb"]
	},
	16: {
		"nome": "Lixo Acumulado Grave",
		"desc": "Acúmulo de mosquitos em grande escala",
		"peso": "3",
		"orgaos": ["Comlurb", "Conservação"]
	},
	17: {
		"nome": "Onda de calor intensa",
		"desc": "Seca em regiões e grande onda de mormaço",
		"peso": "3",
		"orgaos": ["Alerta Rio", "Conservação"]
	},
	18: {
		"nome": "Queda de luz Baixa",
		"desc": "Região residencial sem energia",
		"peso": "1",
		"orgaos": ["Rio Luz"]
	},
	19: {
		"nome": "Queda de luz Moderada",
		"desc": "Região de sinais sem energia",
		"peso": "2",
		"orgaos": ["Rio Luz", "CET Rio"]
	},
	20: {
		"nome": "Queda de luz Grave",
		"desc": "Região de hospitais sem energia",
		"peso": "4",
		"orgaos": ["Rio Luz", "Policia militar", "SAMU"]
	},
	21: {
		"nome": "Seca em área residencial",
		"desc": "Falta d'água em região residencial",
		"peso": "2",
		"orgaos": ["Rio Aguas", "Conservação"]
	},
	22: {
		"nome": "Interditamento de passagem de esgoto",
		"desc": "Acúmulo de sujeira nas tubulações",
		"peso": "3",
		"orgaos": ["Rio Aguas", "Conservação"]
	},
	23: {
	"nome": "Enchente Urbana",
	"desc": "Áreas urbanas inundadas por excesso de chuva",
	"peso": "4",
	"orgaos": ["Rio Aguas", "Geo Rio", "Alerta Rio", "Conservação"]
},
	24: {
	"nome": "Buraco na pista",
	"desc": "Formação de cratera em via pública",
	"peso": "2",
	"orgaos": ["Conservação", "CET Rio"]
},
	25: {
	"nome": "Derramamento de óleo",
	"desc": "Acidente causando óleo em vias públicas",
	"peso": "3",
	"orgaos": ["CET Rio", "Conservação"]
},
	26: {
	"nome": "Desabamento de muro",
	"desc": "Muro de contenção desabou",
	"peso": "3",
	"orgaos": ["Geo Rio", "Conservação", "Bombeiro"]
},
	27: {
	"nome": "Ameaça de bomba",
	"desc": "Suspeita de dispositivo explosivo em área urbana",
	"peso": "5",
	"orgaos": ["Policia militar", "Bombeiro"]
},
	28: {
	"nome": "Rompimento de barragem",
	"desc": "Barragem se rompeu, liberando grande volume de água",
	"peso": "5",
	"orgaos": ["Geo Rio", "Rio Aguas", "Bombeiro", "Policia militar"]
},
	29: {
	"nome": "Protesto em vias públicas",
	"desc": "Manifestação interrompendo o tráfego",
	"peso": "2",
	"orgaos": ["Policia militar", "CET Rio"]
},
	30: {
	"nome": "Incêndio florestal",
	"desc": "Fogo alastrando em área de mata",
	"peso": "4",
	"orgaos": ["Bombeiro", "Alerta Rio", "Conservação"]
},
	31: {
	"nome": "Desmoronamento de ponte",
	"desc": "Estrutura de ponte colapsou",
	"peso": "5",
	"orgaos": ["Bombeiro", "CET Rio", "Geo Rio"]
},
	32: {
	"nome": "Vazamento químico",
	"desc": "Substância perigosa vazando em área industrial",
	"peso": "5",
	"orgaos": ["Bombeiro", "Policia militar", "Conservação"]
},
	33: {
	"nome": "Ataque de animais selvagens",
	"desc": "Animais silvestres em área urbana causando perigo",
	"peso": "3",
	"orgaos": ["Policia militar", "Conservação"]
},
	34: {
	"nome": "Colisão ferroviária",
	"desc": "Trens colidiram, causando danos e possíveis vítimas",
	"peso": "5",
	"orgaos": ["CET Rio", "Bombeiro", "SAMU"]
},
	35: {
	"nome": "Desabamento em obra",
	"desc": "Estruturas colapsaram em área de construção",
	"peso": "4",
	"orgaos": ["Geo Rio", "Bombeiro", "Conservação"]
}
}

func seleciona_desastre():
	var d = randi_range(0, desastres.size() - 1)
	var result = desastres[d]
	return result
