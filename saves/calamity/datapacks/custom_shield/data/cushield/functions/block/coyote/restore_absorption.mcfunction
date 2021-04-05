#getting absorption amount
execute store result score absorption= cush.main run data get entity @s AbsorptionAmount

#saving absorption and clearing it
data modify storage cushield:main effect set from entity @s ActiveEffects[{Id:22b}]
effect clear @s minecraft:absorption

#total calculation
scoreboard players operation @s cush.cy.abs /= 10 num
scoreboard players operation absorption= cush.main += @s cush.cy.abs

#restoring absorption value
function cushield:block/do_damage/absorption/restore