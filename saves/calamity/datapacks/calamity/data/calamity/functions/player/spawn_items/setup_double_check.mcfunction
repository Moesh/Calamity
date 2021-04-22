# Called from: [advancement] calamity:spawn_items/detect_double_items_start

tag @s add DetectDoubleItems

# Revoke the advancement so the player can get it again
advancement revoke @s only calamity:spawn_items/detect_double_items_start