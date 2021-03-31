# Called form calamity:player/spawn_items/handler
# (Called after player has died)

# Clear player's selected item choice if they have chosen so
execute if entity @s[tag=ResetTheSpawnItem] run scoreboard players set @s selectedItem -1
execute if entity @s[tag=ResetTheSpawnItem] run tag @s remove ResetTheSpawnItem

# Revoke spawn item advancements both to clean up, but also to allow players to have spawn items again 
advancement revoke @s from calamity:spawn_items/hidden_root
advancement grant @s only calamity:spawn_items/hidden_root

# Give starting items if player hasn't selected an item
execute if score @s selectedItem matches -1 run loot give @s loot calamity:spawn_items/item0
execute if score @s selectedItem matches -1 run loot give @s loot calamity:spawn_items/item1
execute if score @s selectedItem matches -1 run loot give @s loot calamity:spawn_items/item2
execute if score @s selectedItem matches -1 run loot give @s loot calamity:spawn_items/item3
execute if score @s selectedItem matches -1 run loot give @s loot calamity:spawn_items/item4

# Give the selected item if the player has selected an item
execute unless score @s selectedItem matches -1 run function calamity:player/spawn_items/regive_chosen_item

# Reset death score
scoreboard players set @s giveSpawnItems 0
