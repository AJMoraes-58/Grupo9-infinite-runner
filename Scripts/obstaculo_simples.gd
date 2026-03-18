extends Area2D

func _ready() -> void: #chama a funcao quando ocorre uma colisao
	body_entered.connect(Sistema_De_Colisao)
	
func Sistema_De_Colisao(corpo: Node2D) -> void:
	if corpo.name == "protagonista":
		Fim_De_Jogo()

func Fim_De_Jogo() -> void:
	var tela = get_tree().root.get_node("mundo/TelaDeGameOver")
	get_tree().paused = true
	if tela:
		tela.Mostrar_Tela_Game_Over()
