x_steps = 200	# 200 for 1.8 degree, 400 for 0.9 degree
y_steps = x_steps
z_steps = x_steps
e_steps = x_steps

x_belt_pitch = 2 # mm
y_belt_pitch = x_belt_pitch

x_gear_teeth = 40
y_gear_teeth = x_gear_teeth

x_microstepping = 1/16
y_microstepping = x_microstepping
z_microstepping = x_microstepping
e_microstepping = x_microstepping

z_threadpitch = 1.25 # mm (M8)

e_ratio = 43/10 # Wade's Extruder: 39/11, Accessible Wade's by Greg Frost: 43/10, Adrian's Extruder: 59/11, etc.)

bolt_diameter = 5

x_steps_per_mm = x_steps / (x_microstepping * x_belt_pitch * x_gear_teeth)
y_steps_per_mm = y_steps / (y_microstepping * y_belt_pitch * y_gear_teeth)

z_steps_per_mm = z_steps / (z_microstepping * z_threadpitch)

e_steps_per_mm = e_steps * e_ratio / (e_microstepping * Math.PI * bolt_diameter)

console.log """
Calibration info

x_steps_per_mm = #{x_steps_per_mm}
y_steps_per_mm = #{y_steps_per_mm}
z_steps_per_mm = #{z_steps_per_mm}
e_steps_per_mm = #{e_steps_per_mm}

For Configuration.h:
#define DEFAULT_AXIS_STEPS_PER_UNIT {#{x_steps_per_mm},#{y_steps_per_mm},#{z_steps_per_mm},#{e_steps_per_mm}}
"""