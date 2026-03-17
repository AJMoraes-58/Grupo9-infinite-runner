extends Node2D
@export var protagonista: CharacterBody2D

var segmentoDeCena: PackedScene = preload("res://Cenas/segmento.tscn") #pre carrega o segmento
var marcacaoDeSegmento: float = 0.0 #marca onde termina o segmento para inserir outra

const LARGURA_DO_SEGMENTO: float = 1500.0 

var segmentosAtivos: Array = [] #lista que guarda os segmentos que estao carregados naquele momento
const MAXIMO_DE_SEGMENTOS: int = 4 #numero de segmentos maximos que pode ser carregado de uma vez

func _ready() -> void:
	for cenaSeg in range(MAXIMO_DE_SEGMENTOS): #cria os segmentos iniciais
		Gerar_Segmento()

func _process(delta: float) -> void:
	if protagonista != null: 
		#verifica se a protagonista ta saindo da parte de segmentos carregados
		if protagonista.global_position.x > marcacaoDeSegmento - (LARGURA_DO_SEGMENTO * 2):
			Gerar_Segmento()

func Gerar_Segmento() -> void:
	var novoSegmento = segmentoDeCena.instantiate()
	novoSegmento.global_position.x = marcacaoDeSegmento
	add_child(novoSegmento)
	
	segmentosAtivos.append(novoSegmento) #adiciona o novo segmento de cena a lista
	marcacaoDeSegmento += LARGURA_DO_SEGMENTO #atualiza onde deve ser colocada o proximo segmento
	
	#joga os segmentos ja passados fora para liberar espaco para os novos
	if segmentosAtivos.size() > MAXIMO_DE_SEGMENTOS:
		var segmentoVelho = segmentosAtivos.pop_front()
		segmentoVelho.queue_free() #apaga o nó da memória do PC
