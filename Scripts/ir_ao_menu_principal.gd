extends TextureButton

#codigo comentado: botao da tela de creditos para voltar ao menu principal

func _on_pressed() -> void:
	#troca para a cena de menu
	PainelDeSom.get_node("somDosBotoes").play()
	get_tree().change_scene_to_file("res://Cenas/menu_principal.tscn")
