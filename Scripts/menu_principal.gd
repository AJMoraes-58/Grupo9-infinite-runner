extends Control

#codigo comentado: define o funcionamento de cada botao da tela/menu inicial

func _ready() -> void:
	#ativa a musica da tela inicial
	if not PainelDeSom.get_node("musicaMenu").playing:
		PainelDeSom.get_node("musicaMenu").play()

func _on_jogo_pressed() -> void:
	#para a musica da tela inicial e inicia o jogo indo a cena de mundo
	PainelDeSom.get_node("somDosBotoes").play()
	PainelDeSom.get_node("musicaMenu").stop()
	get_tree().change_scene_to_file("res://Cenas/mundo.tscn")

func _on_credito_pressed() -> void:
	#vai para a cena de creditos
	PainelDeSom.get_node("somDosBotoes").play()
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")

func _on_sair_pressed() -> void:
	#fecha o jogo
	get_tree().quit()
