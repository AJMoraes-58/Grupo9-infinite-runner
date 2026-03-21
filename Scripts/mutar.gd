extends TextureButton

#codigo comentado: botao de ativar e desativar o som da musica (disponivel a qualquer momento do jogo)

func _on_pressed() -> void:
	PainelDeSom.get_node("somDosBotoes").play()
	#pega o id da musica, depois muda seu estado: ligado -> desligado -> ligado
	var somMusica = AudioServer.get_bus_index("musica")
	AudioServer.set_bus_mute(somMusica, not AudioServer.is_bus_mute(somMusica))
