# This function is used for setting up the moving_piston walls.
# Call this function manually while standing on a structure void to make the moving_piston walls for all connected structure void.
# Structure void is expected to be at layer 70.

#replace structure void with air so it wont be detected again
setblock ~ ~ ~ air

fill ~ 0 ~ ~ 67 ~ moving_piston
execute positioned ~1 ~ ~ if block ~ ~ ~ structure_void run function moesh:build_protection/setup_wall
execute positioned ~-1 ~ ~ if block ~ ~ ~ structure_void run function moesh:build_protection/setup_wall
execute positioned ~ ~ ~1 if block ~ ~ ~ structure_void run function moesh:build_protection/setup_wall
execute positioned ~ ~ ~-1 if block ~ ~ ~ structure_void run function moesh:build_protection/setup_wall
execute positioned ~1 ~ ~-1 if block ~ ~ ~ structure_void run function moesh:build_protection/setup_wall
execute positioned ~1 ~ ~1 if block ~ ~ ~ structure_void run function moesh:build_protection/setup_wall
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ structure_void run function moesh:build_protection/setup_wall
execute positioned ~-1 ~ ~1 if block ~ ~ ~ structure_void run function moesh:build_protection/setup_wall

# place the structure void back
setblock ~ ~ ~ structure_void