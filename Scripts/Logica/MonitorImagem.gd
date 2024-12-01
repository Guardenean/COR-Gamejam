extends TextureButton

const imagens = {
	"acidente" : preload("res://Assets/icon.svg"),
	"chuva" : preload("res://Assets/icon.svg"),
	"evento" : preload("res://Assets/icon.svg"),
	"arvore" : preload("res://Assets/icon.svg"),
	"incêndio" : preload("res://Assets/icon.svg"),
}

func muda_imagem(img) -> void:
	texture_normal = imagens[img]
