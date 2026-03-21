extends CanvasLayer

#codigo comentado: define a funcionalidade dos botoes da tela de fim de jogo (gameover)

func _ready() -> void:
	#esconde a tela quando o jogo tiver rolando
	hide()

func Mostrar_Tela_Game_Over() -> void:
	#mostra a tela quando o jogo acaba
	show()

func _on_button_pressed() -> void:
	#recomeca o jogo
	PainelDeSom.get_node("somDosBotoes").play()
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_ir_ao_menu_principal_pressed() -> void:
	#para a musica do momento de gameplay e volta ao menu inicial
	$"../AudioStreamPlayer".stop() #resolve o bug da musica tocando por segundo durante a mudanca de cena
	get_tree().paused = false
	PainelDeSom.get_node("somDosBotoes").play()
	get_tree().change_scene_to_file("res://Cenas/menu_principal.tscn")
