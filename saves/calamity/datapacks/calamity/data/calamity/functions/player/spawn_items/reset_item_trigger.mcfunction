# Called from: calamity:player/spawn_items/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Reset the item trigger
#>--------------------------------------------------------------------------------------------------

scoreboard players set @s resetSpawnItem 0
tellraw @s[tag=ResetTheSpawnItem] {"translate":"calamity.resetItems.alreadyChosen","color":"gray","italic": true}
execute unless score @s selectedItem matches -1 run tellraw @s[tag=!ResetTheSpawnItem] {"translate":"calamity.resetItems","color":"gray","italic": true}
execute unless score @s selectedItem matches -1 run tag @s add ResetTheSpawnItem
execute if score @s selectedItem matches -1 run tellraw @s[tag=!ResetTheSpawnItem] {"translate":"calamity.resetItems.haventChosen","color":"gray","italic": true}