extends TextureRect

@onready var tempo_jogo = $"../TempoJogo"
@onready var tempo = $Tempo

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var time = tempo_jogo.time_left
	var minutos = floor(time / 60.0)
	var segundos = int(time) % 60
	tempo.text = '%02d:%02d' % [minutos, segundos]
