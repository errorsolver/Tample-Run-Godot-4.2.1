extends Node3D

@export var obstacle_scene: PackedScene

func _on_timer_timeout():
	var obstacle = obstacle_scene.instantiate()

	var obstacle_spawn_location = get_node("Path3D/PathFollow3D")
	obstacle_spawn_location.progress_ratio = randf()

	var end_position_x = obstacle_spawn_location.global_transform.basis.x.x
	var end_position_y = obstacle_spawn_location.global_transform.basis.y.y
	var player_position_z = $Player.global_transform.basis.z.z

	var end_line = Vector3(end_position_x, end_position_y, player_position_z)
	
	print("obstacle_spawn_location: ", obstacle_spawn_location.global_transform.basis)
	print("obstacle: ", obstacle.global_transform.basis)
	print("")
	print("Endline: ", end_line)
	print("")
	obstacle.initialize(obstacle_spawn_location.position, player_position_z)

	add_child(obstacle)
