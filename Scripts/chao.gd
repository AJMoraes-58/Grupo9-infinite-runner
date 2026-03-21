extends StaticBody2D

#codigo comentado: define o chao onde a protagonista anda

@export var protagonista: CharacterBody2D

func _physics_process(delta: float) -> void:
	#verifica se a protagosnita realmente spawnou no jogo e fixa o chao nela
	#para criar a ideia de chao infinito
	if protagonista != null:
		global_position.x = protagonista.global_position.x
