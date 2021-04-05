#determining damage received
scoreboard players operation @s cush.cy.dam /= 10 num
#restoring 4 with effect
execute if score @s cush.cy.dam matches 4..7 run effect give @s minecraft:instant_health 1 0 true
execute if score @s cush.cy.dam matches 8..11 run effect give @s minecraft:instant_health 2 0 true
execute if score @s cush.cy.dam matches 12..15 run effect give @s minecraft:instant_health 3 0 true
execute if score @s cush.cy.dam matches 16.. run effect give @s minecraft:instant_health 4 0 true
##restoring half hearts
#scoreboard players operation @s cush.dam %= 4 num
#execute if score @s cush.cy.dam matches 1 run effect give @s minecraft:regeneration 1 1 true
#execute if score @s cush.cy.dam matches 2 run effect give @s minecraft:regeneration 2 1 true
#execute if score @s cush.cy.dam matches 3 run effect give @s minecraft:regeneration 3 1 true