# called from the advancement calamity:spawn_items/detect_repaired_starting_items

tag @s add ClearRepairedStartingItems

# revoke the advancement so the player can get it again
advancement revoke @s only calamity:spawn_items/detect_repaired_starting_items