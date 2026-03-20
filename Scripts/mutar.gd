extends TextureButton

func _on_pressed() -> void:
	var somMusica = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(somMusica, not AudioServer.is_bus_mute(somMusica))
