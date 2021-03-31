scoreboard players set @s resetSpawnItem 0
tellraw @s[tag=ResetTheSpawnItem] {"translate":">>> You have already chosen to reset your item next time you respawn."}
execute unless score @s selectedItem matches -1 run tellraw @s[tag=!ResetTheSpawnItem] {"translate":">>> You will get to select a new item the next time you respawn."}
execute unless score @s selectedItem matches -1 run tag @s add ResetTheSpawnItem
execute if score @s selectedItem matches -1 run tellraw @s[tag=!ResetTheSpawnItem] {"translate":">>> You haven't selected an item yet. Nothing to reset."}