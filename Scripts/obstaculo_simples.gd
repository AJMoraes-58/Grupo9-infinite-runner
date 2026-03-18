extends Area2D

func _ready() -> void: #chama a funcao quando ocorre uma colisao
	body_entered.connect(Sistema_De_Colisao)
	
func Sistema_De_Colisao(corpo: Node2D) -> void:
	if corpo.name == "protagonista":
		get_tree().call_deferred("reload_current_scene") #recarrega o jogo quando bate
