extends Node2D
export var number_of_particles = -1
export var target  = Vector2(500, 250)
var particle_array = []
var best_in_swarm_fitness = 10000
var best_in_swarm

func _ready():
	if number_of_particles <= 0:
		number_of_particles = 1
	for i in range(0, number_of_particles):
		var scene = load("res://Particle.tscn")
		var particle = scene.instance()
		particle.set_name("particle_" + str(i))
		particle.position_max = Vector2(500, 600)
		particle.position_min = Vector2(500, 600)
		particle.velocity_max = Vector2(400, 400)
		particle.target = target
		add_child(particle)
		particle_array.append(particle)
		print(particle.swarm_best)
	
func _process(delta):
	for i in range(0, number_of_particles):
		var particle = particle_array[i]
		if best_in_swarm_fitness > particle.evaluate_position():
			best_in_swarm_fitness = particle.evaluate_position()
			best_in_swarm = particle.position
		if particle.particle_best_fitness > particle.evaluate_position():
			particle.particle_best_fitness = particle.evaluate_position()
			particle.particle_best = particle.position
			
	for i in range(0, number_of_particles):
		var particle = particle_array[i]
		particle.update_best_particle_in_swarm(best_in_swarm)
		
func _input(event):
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
		target = event.position
		best_in_swarm_fitness = 10000
		for i in range(0, number_of_particles):
			particle_array[i].update_target(target)