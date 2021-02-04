extends RigidBody2D

var cena

func _ready():
	cena = get_tree().get_current_scene()

	set_process(true);
	
func _input(event):
	if event.is_action_pressed("touch"):
		on_touch()
		$AnimRotate.play("idle")
		$FelpudoAnim.play("default")
		$AuxAnim.start()
		
		
		
		
		
func on_touch():
	if cena.estado == cena.JOGANDO:
		apply_impulse(Vector2(0, 0), Vector2(0, -1000))
		get_node("SomVoa").play()
#		


func _on_AuxAnim_timeout():
	#$FelpudoAnim.stop()
	#$FelpudoAnim.set_frame(5) 
	$AnimRotate.play("rotate")
	



