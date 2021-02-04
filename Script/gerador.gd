extends Position2D



onready var Cano = load("res://scenes/Cano.tscn")



func _ready():
	randomize()






func _on_Timer_timeout():
	
	var novoCano = Cano.instance()
	novoCano.set_position(Vector2(1166, rand_range(358, 1266)))
	get_owner().add_child(novoCano)
	


