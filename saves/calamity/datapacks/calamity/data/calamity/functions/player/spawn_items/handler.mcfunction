# Called from: calamity:game_state/tick_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Handling for spawn items
#>--------------------------------------------------------------------------------------------------

# When an item changing command is called from a function which was granted by an advancement triggered by an inventory changed
# the items sometimes don't visually update.
# To fix this we give the player a tag to show what change we want to make to the inventory and then make that change in here.

# Clear starting items
execute if entity @s[tag=ClearStartingItems] run clear @s[gamemode=!creative] #calamity:spawn_item{Calamity:{SpawnSelectionItem:1b}}
tag @s[tag=ClearStartingItems] remove ClearStartingItems

# Clear items which are of a different type than the type the player selected
execute if entity @s[tag=clearWrongSpawnItems] unless score @s selectedItem matches 100 run clear @s[gamemode=!creative] #calamity:spawn_item{Calamity:{SpawnSelectionItem:0b,SpawnItemId:100b}}
execute if entity @s[tag=clearWrongSpawnItems] unless score @s selectedItem matches 101 run clear @s[gamemode=!creative] #calamity:spawn_item{Calamity:{SpawnSelectionItem:0b,SpawnItemId:101b}}
execute if entity @s[tag=clearWrongSpawnItems] unless score @s selectedItem matches 102 run clear @s[gamemode=!creative] #calamity:spawn_item{Calamity:{SpawnSelectionItem:0b,SpawnItemId:102b}}
execute if entity @s[tag=clearWrongSpawnItems] unless score @s selectedItem matches 103 run clear @s[gamemode=!creative] #calamity:spawn_item{Calamity:{SpawnSelectionItem:0b,SpawnItemId:103b}}
execute if entity @s[tag=clearWrongSpawnItems] unless score @s selectedItem matches 104 run clear @s[gamemode=!creative] #calamity:spawn_item{Calamity:{SpawnSelectionItem:0b,SpawnItemId:104b}}
tag @s[tag=clearWrongSpawnItems] remove clearWrongSpawnItems

# Clear items repaired with starting items
execute if entity @s[tag=ClearRepairedStartingItems] run clear @s[gamemode=!creative] #calamity:spawn_item{Enchantments:[{id:"minecraft:vanishing_curse",lvl:10s}],RepairCost:1}
tag @s[tag=ClearRepairedStartingItems] remove ClearRepairedStartingItems

# Detect if the player has 2 selected starting items and clear one of them
# Using an extra tag here so the player can get the tag again when an item is cleared
tag @s[tag=DetectDoubleItems] add DetectedDoubleItems
tag @s[tag=DetectDoubleItems] remove DetectDoubleItems
execute if entity @s[tag=DetectedDoubleItems] store result score #tempVar gameVariable run clear @s #calamity:spawn_item{Calamity:{SpawnItem:1b}} 0
execute if entity @s[tag=DetectedDoubleItems] if score #tempVar gameVariable matches 2.. run clear @s #calamity:spawn_item{Calamity:{SpawnItem:1b,SpawnSelectionItem:0b}} 1
tag @s[tag=DetectedDoubleItems] remove DetectedDoubleItems
scoreboard players reset #tempVar gameVariable

# Give the player their chosen item
execute if entity @s[tag=GiveSelectedStartingItem] run function calamity:player/spawn_items/regive_chosen_item
tag @s[tag=GiveSelectedStartingItem] remove GiveSelectedStartingItem

# On death give selection items after a little time
execute if entity @s[scores={giveSpawnItems=1..,timeSinceDeath=1..}] run function calamity:player/spawn_items/give_items

scoreboard players enable @s resetSpawnItem
execute unless score @s resetSpawnItem matches 0 run function calamity:player/spawn_items/reset_item_trigger