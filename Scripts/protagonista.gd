extends CharacterBody2D

#var para vaiaveis; const para constantes
#valor do pulo tem que ser negativo porque y=0 eh o topo da tela

const VELOCIDADE_DA_CORRIDA: float = 300.0
const VELOCIDADE_DO_PULO: float = -450.0
const MAXIMO_DE_PULOS: int = 2

var gravidade = ProjectSettings.get_setting("physics/2d/default_gravity") #valor padrao do godot
var quantidadeDePulos: int = 0

func _physics_process(delta: float) -> void: #loop para o jogo rodar
	if not is_on_floor():
		velocity.y += gravidade*delta
	else:
		quantidadeDePulos = 0
	
	#ui_up eh a seta pra cima
	if Input.is_action_just_pressed("ui_up") and quantidadeDePulos < MAXIMO_DE_PULOS:
		velocity.y = VELOCIDADE_DO_PULO
		quantidadeDePulos += 1
	
	velocity.x = VELOCIDADE_DA_CORRIDA
	move_and_slide()
