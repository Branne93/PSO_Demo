extends Node2D

export var position_max = Vector2(-1, -1)
export var position_min = Vector2(-1, -1)
export var velocity = Vector2(0, 0)
export var velocity_max = Vector2(0, 0)
var swarm_best = Vector2(0, 0)
var particle_best  = Vector2(0, 0)
var particle_best_fitness = 100000
var cognitive
var social
var inertia_weight
var random1
var random2
var target = Vector2(0, 0)


func _ready():
	position = initiaLize_position()
	velocity = initialize_velocity()
	social = 1
	cognitive = 1
	inertia_weight = 1.1
	swarm_best = position
	particle_best = position
	print("Position: " + str(position))
	print("Velocity " + str(velocity))
	
	
func _process(delta):
	position = position + velocity*delta
	update_velocity()

func initiaLize_position():
	randomize()
	var random_number = randf()
	var new_x = (position_max.x - position_min.x) + random_number * position_min.x
	randomize()
	random_number = randf()
	var new_y = (position_max.y - position_min.y) + random_number * position_min.y
	return Vector2(new_x, new_y)
	
func initialize_velocity():
	randomize()
	var random_number = randf()
	var new_x = (-1 * (position_max.x - position_min.x)/2) + random_number * position_min.x
	randomize()
	random_number = randf()
	var new_y = (-1 * (position_max.y - position_min.y)/2) + random_number * position_min.y
	var new_velocity = Vector2(new_x, new_y)
	if new_velocity.length() > velocity_max.length():
		new_velocity = new_velocity.normalized() * velocity_max.length()
	return new_velocity
	
func evaluate_position():
	return position.distance_to(target)
	
func update_velocity():
	randomize()
	var random_number1 = randf()
	randomize()
	var random_number2 = randf()
	velocity = velocity * inertia_weight + random_number1 * social * (particle_best - position) + random_number2 * cognitive * (swarm_best - position)
	if velocity.length() > velocity_max.length():
		velocity = velocity.normalized() * velocity_max.length()
	
func update_best_particle(new_best):
	particle_best = new_best
	
func update_best_particle_in_swarm(new_best):
	swarm_best = new_best
	
func update_target(new_target):
	particle_best_fitness = 100000
	target = new_target
