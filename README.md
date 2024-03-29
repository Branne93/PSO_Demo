# PSO_Demo
Particle swarm objects in godot 3 demo. This is usually done for particle swarm optimization but I thought it would look cool in a game engine.
Right now the swarm is just flying to wherever the user clicks, which is pretty fun to look at. The "particles" are trying to find the closest position to the click.
If you want them to find something else or complete some different task, just edit the evaluate_particle function in Particle.gd and _process in the Swarm.gd so it actually selects the new best particles properly.

Please note that by particles I don't mean particles in a game physics/graphics sense, what I mean is swarm particles, which are in this demo represented by a regular node2d with a sprite. I hope this isn't confusing.
Each particle has some parameters controlling their behaviour. These can be modified to change their efficiency and how they handle.

# Video

https://user-images.githubusercontent.com/6595854/122966311-77dec300-d389-11eb-8421-73bcf131c2b9.mp4




|	Variable 	|	Description	|
| ------------- | ------------- |
|social|How much each particle will follow the position of the best performing particle in the swarm	|
|cognitive|How much each particle will follow the position of the best performing particle itself has ever found	|
|inertia_weight|How much independence a particle will have. A value <1 will lead to it being more controlled while a value 1> will lead to more exploration|


# How to install
Clone project, start godot, import the project.godot file from the cloned project.

# Issues
The code is not reformatted properly, a lot of things are still left over from the math equation, x_min and x_max vectors come to mind as I have yet to find proper parameters from them.


