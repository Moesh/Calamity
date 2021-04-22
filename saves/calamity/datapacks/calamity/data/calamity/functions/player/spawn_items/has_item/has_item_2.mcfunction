# Called from: [advancement] calamity:spawn_items/has_item/has_item_0

# Tag player if they aren't supposed to have the item.
execute unless score @s selectedItem matches 102 run tag @s add clearWrongSpawnItems

# Revoke advancement so the player can get it again.
# Notice advancement is only revoked if the player isn't supposed to have the item.
execute unless score @s selectedItem matches 102 run advancement revoke @s only calamity:spawn_items/has_item/has_item_2