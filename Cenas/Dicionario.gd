extends Node

const desastres = {
	0: {
		"nome" : "Acidente",
		"desc" : "Carros se chocaram"
	},
	1: {
		"nome" : "Chuva Fraca",
		"desc" : "Chuva ultrapassou os 10mm/h"
	},
	2: {
		"nome" : "Chuva Moderada",
		"desc" : "Chuva ultrapassou os 20mm/h"
	},
	3: {
		"nome" : "Chuva Forte",
		"desc" : "Chuva ultrapassou os 30mm/h"
	},
	4: {
		"nome" : "Evento",
		"desc" : "Final do Jogo de futebol"
	},
	5: {
		"nome" : "Grande Evento",
		"desc" : "Show de artista vindo de fora"
	},
	6: {
		"nome" : "Queda de árvore",
		"desc" : "Árvore em queda de residência"
	},
	7: {
		"nome" : "Queda de árvore Moderada",
		"desc" : "Árvore em queda de Fios de eletricidade"
	},
	8: {
		"nome" : "Chance da vinda do mar de volta a costa com força",
		"desc" : "Maré Baixa"
	},
	9: {
		"nome" : "Colápso de Prédio",
		"desc" : "Prédio desabou"
	},
	10: {
		"nome" : "Deslizamento de Terra",
		"desc" : "Terra gerou escombros arrastando área"
	},
	11: {
		"nome" : "Incêndio Urbano",
		"desc" : "Fogo se alastrando sobe prédio"
	},
	12: {
		"nome" : "Rompimento de tubulação",
		"desc" : "Cano explodiu, jogando água a rua"
	},
	13: {
		"nome" : "Falha de transporte publico",
		"desc" : "Ônibus com falha ao meio da pista"
	},
	14: {
		"nome" : "Queda de árvore Grave",
		"desc" : "Queda em carro de família, vitimas"
	},
	15: {
		"nome" : "Lixo Acumulado Baixo",
		"desc" : "Acumulo de móscas na região"
	},
	16: {
		"nome" : "Lixo Acumulado Grave",
		"desc" : "Acumulo de mosquitos em grande escala"
	},
	17: {
		"nome" : "Onda de calor intensa",
		"desc" : "Seca em regiões e grande onda de mormaço"
	},
	18: {
		"nome" : "Queda de luz Baixa",
		"desc" : "Região residencial sem energia"
	},
	19: {
		"nome" : "Queda de luz Moderada",
		"desc" : "Região de sinais sem energia"
	},
	20: {
		"nome" : "Queda de luz Grave",
		"desc" : "Região de hospitals sem energia"
	},
	21: {
		"nome" : "Seca em área residencial",
		"desc" : "Falta d'água em região residencial"
	},
	22: {
		"nome" : "Interditamento de passagem de esgoto",
		"desc" : "Acumulo de sujeira nas tubulações"
	},
}
	
func seleciona_desastre():
	var d = randi_range(0, desastres.size() - 1)
	var _result = desastres[d]
	return desastres
