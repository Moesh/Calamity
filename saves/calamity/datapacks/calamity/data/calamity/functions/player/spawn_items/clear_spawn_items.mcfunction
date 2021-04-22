# Called from: [advancement] calamity:spawn_items/detect_repaired_starting_items

tag @s add ClearStartingItems

# Revoke the advancement and grant advancement lock so the player can get it again
advancement revoke @s only calamity:spawn_items/detect_spawn_item
advancement grant @s only calamity:spawn_items/detect_spawn_item advancement_lock