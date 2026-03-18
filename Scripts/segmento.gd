extends Node2D
@onready var listaDeObstaculos = [$obstaculoSimples, $obstaculoSimples2, $obstaculoSimples3]

const PROBABILIDADE_DE_APARECER: float = 0.5
const ZONA_DE_SEGURANCA: float = 500.0
const QUANTIDADE_MAXIMA_DE_OBSTACULOS_APAGADOS: int = 2

func _ready() -> void:
	var quantidadeApagada = 0
	
	if global_position.x <= ZONA_DE_SEGURANCA: #forca a zona segura a existir
		for obstaculos in listaDeObstaculos:
			if obstaculos != null:
				obstaculos.queue_free()
		return
				
		for obstaculos in listaDeObstaculos:
			if obstaculos != null:
				
				if quantidadeApagada >= QUANTIDADE_MAXIMA_DE_OBSTACULOS_APAGADOS: #obriga a ter pelo menos 1 obstaculo por segmento
					continue
				
				var probabilidade = randf() #gera um numero aleatorio entre 0.0 e 1.0
			
				if probabilidade > PROBABILIDADE_DE_APARECER: #aleatoriedade nos obstaculos
					obstaculos.queue_free()
					quantidadeApagada += 1
