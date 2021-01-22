# Called from calamity:player/spawn_items/handler

# Make it so the player won't be allowed to have spawn selection items any more
advancement grant @s only calamity:spawn_items/detect_spawn_item advancement_lock

# Get the ids of the tools in the player's hands
scoreboard players set #tempMainHandId gameVariable 0
scoreboard players set #tempOffHandId gameVariable 0
scoreboard players set #tempFoundItemId gameVariable 0

execute store result score #tempMainHandId gameVariable run data get entity @s SelectedItem.tag.Calamity.SpawnItemId
execute store result score #tempOffHandId gameVariable run data get entity @s Inventory[{Slot:-106b}].tag.Calamity.SpawnItemId

# Clear the selection items
function calamity:player/spawn_items/clear_spawn_items

# Regive the selected item and put it at the same location
execute if score @s selectedItem = #tempMainHandId gameVariable run loot replace entity @s weapon.mainhand loot calamity:spawn_items/give_item_from_score
execute if score @s selectedItem = #tempMainHandId gameVariable run scoreboard players set #tempFoundItemId gameVariable 1

execute if score #tempFoundItemId gameVariable matches 0 if score @s selectedItem = #tempOffHandId gameVariable run loot replace entity @s weapon.offhand loot calamity:spawn_items/give_item_from_score
execute if score @s selectedItem = #tempOffHandId gameVariable run scoreboard players set #tempFoundItemId gameVariable 1

execute if score #tempFoundItemId gameVariable matches 0 run loot give @s loot calamity:spawn_items/give_item_from_score

# Clear up our temp variables
scoreboard players reset #tempMainHandId gameVariable
scoreboard players reset #tempOffHandId gameVariable
scoreboard players reset #tempFoundItemId gameVariable