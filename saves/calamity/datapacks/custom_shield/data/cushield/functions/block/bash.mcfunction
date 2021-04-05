#writing score
scoreboard players operation effect= cush.main = @s cush.bash

#effects
function cushield:event/bash_effect

#ending block
execute if score @s cush.sprint matches 1.. run tag @s add cushield.blocked