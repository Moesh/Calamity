# Revoke spawn item advancements both to clean up, but also to allow players to have spawn items again 
advancement revoke @s from calamity:spawn_items/hidden_root
advancement grant @s only calamity:spawn_items/hidden_root

# Reset scores
scoreboard players set @s selectedItem -1
scoreboard players set @s giveSpawnItems 0

# Give starting items
loot give @s loot calamity:spawn_items/item0
loot give @s loot calamity:spawn_items/item1
loot give @s loot calamity:spawn_items/item2
loot give @s loot calamity:spawn_items/item3
loot give @s loot calamity:spawn_items/item4