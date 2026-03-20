extends Control
	
func _on_jogo_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/mundo.tscn")

func _on_credito_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()
