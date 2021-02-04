extends Node2D

onready var felpudo = get_node("Felpudo")
onready var timereplay = get_node("TimerToReplay")
onready var label = get_node("Node2D/Control/Label")
onready var rank


var pontos = 0
var estado = 1
var rank1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	rank = get_tree().get_root().get_node("/root/Rank")
	pass
	
	
func _process(delta):
	print(rank.array)
	if pontos >= 5:
		$Canos/Gerador/Timer.wait_time = 2.7
	if pontos >= 10:
		$Canos/Gerador/Timer.wait_time = 2.5
	if pontos >= 20:
		$Canos/Gerador/Timer.wait_time = 2
	if pontos >= 40:
		$Canos/Gerador/Timer.wait_time = 1.8
	if pontos >= 60:
		$Canos/Gerador/Timer.wait_time = 1.5
	
	
func kill():
	felpudo.apply_impulse(Vector2(0, 0), Vector2(-1000, 0)) 
	get_node("BackAnim").stop()
	estado = PERDENDO
	timereplay.start()
	get_node("SomHit").play()
	
	
func pontuar():
	pontos += 1
	label.set_text(str(pontos))
	get_node("SomScore").play()


	


func _on_TimerToReplay_timeout():
	rank.array[0] = pontos
	get_tree().change_scene("res://scenes/GameHome.tscn")

	
