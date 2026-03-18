extends Node2D
@onready var opcoesDeObstaculos = [preload("res://Cenas/obstaculo_simples.tscn")]
@onready var pontosParaGeracao = [$pontoUm, $pontoDois, $pontoTres] #pontos seguros de pulo valido

const ZONA_DE_SEGURANCA: float = 400.0
const MINIMO_DE_OBSTACULO_POR_SEGMENTO: int = 1
const MAXIMO_DE_OBSTACULO_POR_SEGMENTO: int = 3

func _ready() -> void:
	Gerar_Area_De_Obstaculos()
	
	
func Gerar_Area_De_Obstaculos() -> void:
	
	for filho in get_children(): #tira os obstaculos de cima do chao pra rodar o codigo e gerar os segmentos aleatorios
		if filho.is_in_group("obs_tacu_los"):
			filho.queue_free()
		
	if global_position.x <= ZONA_DE_SEGURANCA: #forca a zona segura a existir encerrando a funcao
		return
	
	#sorteio da quantidade de obstaculos por segmento
	var quantidadeDeObstaculos = randi_range(MINIMO_DE_OBSTACULO_POR_SEGMENTO, MAXIMO_DE_OBSTACULO_POR_SEGMENTO)
	var pontosDisponiveis = pontosParaGeracao.duplicate()
	pontosDisponiveis.shuffle()
	
	#geracao dos obstaculos seguindo o estipulado no sorteio
	for quantidade in range(quantidadeDeObstaculos):
		var pontoSorteado = pontosDisponiveis[quantidade]
		var obstaculoEscolhido = opcoesDeObstaculos.pick_random()
		var obstaculoNovo = obstaculoEscolhido.instantiate()
		obstaculoNovo.position = pontoSorteado.position
		obstaculoNovo.add_to_group("obs_tacu_los")
		
		add_child(obstaculoNovo)
