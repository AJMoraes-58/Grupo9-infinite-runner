extends CharacterBody2D

#var para vaiaveis; const para constantes
#valor do pulo tem que ser negativo porque y=0 eh o topo da tela

const VELOCIDADE_DA_CORRIDA: float = 300.0
const VELOCIDADE_DO_PULO = -400
var gravidade = ProjectSettings.get_setting("physics/2d/default_gravity") #valor padrao do godot

func _physics_process(delta: float) -> void: #loop para o jogo rodar
	if not is_on_floor():
		velocity.y += gravidade*delta
	
	#ui_up eh a seta pra cima
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = VELOCIDADE_DO_PULO
	velocity.x = VELOCIDADE_DA_CORRIDA
	move_and_slide() #movimenta o personagem
