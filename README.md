# PSO_Demo
Particle swarm objects in godot 3 demo. This is usually done for particle swarm optimization but I thought it would look cool in a game engine.
Right now the swarm is just flying to wherever the user clicks, which is pretty fun to look at. The "particles" are trying to find the closest position to the click.
If you want them to find something else or complete some different task, just edit the evaluate_particle function in Particle.gd and _process in the Swarm.gd so it actually selected the new best particles properly.


# How to install
Clone project, start godot, import the project.godot file from the cloned project.

# Issues
The code is not reformatted properly, a lot of things are still left over from the math equation, x_min and x_max vectors come to mind as I have yet to find proper parameters from them.

