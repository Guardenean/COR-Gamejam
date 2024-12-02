extends TextureButton

const imagens = {
	"acidente" : preload("res://Assets/SpritesPrincipais/Monitor/Acidente.png"),
	"chuva" : preload("res://Assets/SpritesPrincipais/Monitor/Chuva.png"),
	"evento" : preload("res://Assets/SpritesPrincipais/Monitor/Evento.png"),
	"arvore" : preload("res://Assets/SpritesPrincipais/Monitor/Arvore.png"),
	"incendio" : preload("res://Assets/SpritesPrincipais/Monitor/Incendio.png"),
	"desabamento_obra" : preload("res://Assets/SpritesPrincipais/Monitor/DesabamentoConstr.jpg"),
	"seca" : preload("res://Assets/SpritesPrincipais/Monitor/Seca.jpg"),
	"buraco" : preload("res://Assets/SpritesPrincipais/Monitor/Buraco.jpg"),
	"protesto" : preload("res://Assets/SpritesPrincipais/Monitor/Protesto.png"),
	"oleo" : preload("res://Assets/SpritesPrincipais/Monitor/Oleo.jpg"),
	"muro" : preload("res://Assets/SpritesPrincipais/Monitor/Muro.jpg"),
	"trem" : preload("res://Assets/SpritesPrincipais/Monitor/Trem.jpg"),
	"placeholder" : preload("res://Assets/icon.svg")
}

func muda_imagem(img) -> void:
	texture_normal = imagens[img]
