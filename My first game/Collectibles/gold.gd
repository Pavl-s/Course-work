extends Area2D




func _on_body_entered(body):
	if body.name =="Player":
		
		var tween= get_tree().create_tween()
		var tween1= get_tree().create_tween()
		
		tween1.tween_property(self, "modulation", 0, 0.3)
		tween.tween_callback(queue_free)
		body.gold += 10
			
		
