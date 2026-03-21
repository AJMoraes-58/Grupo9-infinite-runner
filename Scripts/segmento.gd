extends Node2D

#codigo comentado: gerencia a criacao dos obstaculos, sua zona de seguranca e sua aleatoriedade

#carrega os obstaculos e os pontos onde podem aparecer
@onready var opcoesDeObstaculos = [preload("res://Cenas/cadeira.tscn"), preload("res://Cenas/cadeira_caida.tscn"),
									preload("res://Cenas/caixa.tscn"), preload("res://Cenas/computador.tscn")]
@onready var pontosParaGeracao = [$pontoUm, $pontoDois, $pontoTres] #pontos seguros de pulo valido

const ZONA_DE_SEGURANCA: float = 400.0 #area onde nao nasce obstaculos (inicio)
const MINIMO_DE_OBSTACULO_POR_SEGMENTO: int = 1
const MAXIMO_DE_OBSTACULO_POR_SEGMENTO: int = 3

func _ready() -> void:
	#chama a funcao de criar obstaculos assim que o segmento eh carregado
	Gerar_Area_De_Obstaculos()
	
	
func Gerar_Area_De_Obstaculos() -> void:
	
	#tira os obstaculos de cima do chao pra rodar o codigo e gerar os segmentos aleatorios
	for filho in get_children(): 
		if filho.is_in_group("obs_tacu_los"): #verifica se o filho tem a etiqueta de obstaculo
			filho.queue_free() #apaga
		
	#forca a zona segura a existir encerrando a funcao
	if global_position.x <= ZONA_DE_SEGURANCA: 
		return
	
	#sorteio da quantidade de obstaculos por segmento
	var quantidadeDeObstaculos = randi_range(MINIMO_DE_OBSTACULO_POR_SEGMENTO, MAXIMO_DE_OBSTACULO_POR_SEGMENTO)
	var pontosDisponiveis = pontosParaGeracao.duplicate()
	pontosDisponiveis.shuffle() #aleatoriza os pontos de surgimento
	
	#geracao dos obstaculos seguindo o estipulado no sorteio
	for quantidade in range(quantidadeDeObstaculos):
		var pontoSorteado = pontosDisponiveis[quantidade]
		var obstaculoEscolhido = opcoesDeObstaculos.pick_random()
		var obstaculoNovo = obstaculoEscolhido.instantiate() #transforma o obstaculo em real no jogo
		obstaculoNovo.position = pontoSorteado.position
		obstaculoNovo.add_to_group("obs_tacu_los")
		
		add_child(obstaculoNovo) #faz aparecer na tela
