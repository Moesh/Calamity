# When an item changing command is called from a function which was granted by an advancement triggered by an inventory changed
# the items sometimes don't visually update.
# To fix this we give the player a tag to show what change we want to make to the inventory and then make that change in here.

# Clear starting items
execute if entity @s[tag=ClearStartingItems] run clear @s[gamemode=!creative] #calamity:spawn_item{Calamity:{SpawnSelectionItem:1b}}
tag @s[tag=ClearStartingItems] remove ClearStartingItems

# Clear items repaired with starting items
execute if entity @s[tag=ClearRepairedStartingItems] run clear @s[gamemode=!creative] #calamity:spawn_item{Enchantments:[{id:"minecraft:vanishing_curse",lvl:10s}],RepairCost:1}
tag @s[tag=ClearRepairedStartingItems] remove ClearRepairedStartingItems

# Detect if the player has 2 selected starting items and clear one of them
execute if entity @s[tag=DetectDoubleItems] store result score #tempVar gameVariable run clear @s #calamity:spawn_item{Calamity:{SpawnItem:1b}} 0
execute if entity @s[tag=DetectDoubleItems] if score #tempVar gameVariable matches 2.. run clear @s #calamity:spawn_item{Calamity:{SpawnItem:1b,SpawnSelectionItem:0b}} 1
tag @s[tag=DetectDoubleItems] remove DetectDoubleItems
scoreboard players reset #tempVar gameVariable

# Give the player their chosen item
execute if entity @s[tag=GiveSelectedStartingItem] run function calamity:player/spawn_items/regive_chosen_item
tag @s[tag=GiveSelectedStartingItem] remove GiveSelectedStartingItem

# On death give selection items
execute if entity @s[scores={giveSpawnItems=1..}] run function calamity:player/spawn_items/give_items