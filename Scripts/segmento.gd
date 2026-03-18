extends Node2D
@onready var opcoesDeObstaculos = [preload("res://Cenas/obstaculo_simples.tscn")]
@onready var pontosParaGeracao = [$pontoUm, $pontoDois, $pontoTres] #pontos seguros de pulo valido

const PROBABILIDADE_DE_APARECER: float = 0.5
const ZONA_DE_SEGURANCA: float = 500.0

func _ready() -> void:
	if global_position.x <= ZONA_DE_SEGURANCA: #forca a zona segura a existir encerrando a funcao
		return
	
	var quantidadeGerada = 0
	
	for ponto in pontosParaGeracao: #analise de cada ponto seguro
		var geracaoForcada = false
		
		if ponto == $pontoTres and quantidadeGerada == 0: #obriga a ter pelo menos 1 obstaculo por segmento
			geracaoForcada = true
		
		var probabilidade = randf() #gera um numero aleatorio entre 0.0 e 1.0
		
		if probabilidade > PROBABILIDADE_DE_APARECER or geracaoForcada:
			var obstaculoEscolhido = opcoesDeObstaculos.pick_random()
			var obstaculoNovo = obstaculoEscolhido.instantiate()
			
			obstaculoNovo.position = ponto.position
			add_child(obstaculoNovo)
			
			quantidadeGerada += 1
