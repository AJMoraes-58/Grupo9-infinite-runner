extends TextureButton

func _on_pressed() -> void:
	PainelDeSom.get_node("somDosBotoes").play()
	var somMusica = AudioServer.get_bus_index("musica")
	AudioServer.set_bus_mute(somMusica, not AudioServer.is_bus_mute(somMusica))
