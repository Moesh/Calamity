#determining to run coyote parry
function cushield:get_shield_stats
execute if score can= cush.cy.dur matches 1 run function cushield:block/coyote/do
scoreboard players reset @s cush.cy.dur