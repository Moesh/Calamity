# Called from: moesh:tick

# Players shouldn't be able to place blocks over the void.
# To stop this we use "moving_piston" blocks which normally are used for marking blocks which are being pushed.
#
# Players cannot place blocks on moving_piston blocks. The block can not be pushed. Water can't flow through them.
# The block has no hitbox so arrows can fly through them.
# The only problem with the block is that tnt can blow it up.
# To fix this we have to find all tnt which are about to explode and fix the destroyed walls of moving_piston blocks.
#
#
# Extra notes about moving_piston:
# Normally the block has tile entity data to store information about the pushed block, but when setblocked it won't.
# This is lucky for us since tile entities in big amounts can be laggy. So we shouldn't get any perfomance issues from having a ton of these blocks.
#
# moving_piston doesn't drop any items when it doesn't have tile entity data.
# If it did drop items then we could simple just execute at those items and place new blocks to fix the explosion damage.
#
# moving_piston blocks doesn't have any blast resistance so it shouldn't mess with the tnt explosions.


# We can't detect the tnt after it has exploded.
# We summon a marker entity at tnt which is about to explode so we can use the tnt's location after it has blown up.
execute as @e[tag=ExplosionMarker] at @s run function moesh:build_protection/handle_explosion
execute as @e[type=tnt,nbt={Fuse:1s}] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:2,Tags:["ExplosionMarker"]}