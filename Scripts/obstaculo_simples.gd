extends Area2D

#codigo comentado: verifica colisoes entre personagem x obstaculo 
#e eh o responsavel por finalizar o jogo quando ocorre

func _ready() -> void: #fica esperto pra chamar a funcao de colisao quando analisa que ocorreu uma
	body_entered.connect(Sistema_De_Colisao)
	
func Sistema_De_Colisao(corpo: Node2D) -> void: 
	#chama a funcao de finalizar o jogo quando ocorre uma colisao protagonista x obstaculo
	if corpo.name == "protagonista":
		Fim_De_Jogo()

func Fim_De_Jogo() -> void:
	#finaliza (pausa) o jogo e troca para a tela de gameover
	var tela = get_tree().root.get_node("mundo/telaDeGameOver")
	get_tree().paused = true
	if tela:
		tela.Mostrar_Tela_Game_Over()
