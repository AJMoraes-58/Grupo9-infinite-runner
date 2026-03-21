extends TextureButton

func _on_pressed() -> void:
	PainelDeSom.get_node("somDosBotoes").play()
	get_tree().change_scene_to_file("res://Cenas/menu_principal.tscn")
