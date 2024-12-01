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
}

func muda_imagem(img) -> void:
	texture_normal = imagens[img]
