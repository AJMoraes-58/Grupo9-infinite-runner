extends Control
	
func _ready() -> void:
	if not PainelDeSom.get_node("musicaMenu").playing:
		PainelDeSom.get_node("musicaMenu").play()

func _on_jogo_pressed() -> void:
	PainelDeSom.get_node("somDosBotoes").play()
	PainelDeSom.get_node("musicaMenu").stop()
	get_tree().change_scene_to_file("res://Cenas/mundo.tscn")

func _on_credito_pressed() -> void:
	PainelDeSom.get_node("somDosBotoes").play()
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")

func _on_sair_pressed() -> void:
	PainelDeSom.get_node("somDosBotoes").play()
	get_tree().quit()
