extends TextureButton

const imagens = {
	"acidente" : preload("res://Assets/SpritesPrincipais/Monitor/Acidente.png"),
	"chuva" : preload("res://Assets/SpritesPrincipais/Monitor/Chuva.png"),
	"evento" : preload("res://Assets/SpritesPrincipais/Monitor/Evento.png"),
	"arvore" : preload("res://Assets/SpritesPrincipais/Monitor/Arvore.png"),
	"incendio" : preload("res://Assets/SpritesPrincipais/Monitor/Incendio.png"),
}

func muda_imagem(img) -> void:
	texture_normal = imagens[img]
