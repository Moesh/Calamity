# Called from: calamity:build_protection/search/small_section_all

#>--------------------------------------------------------------------------------------------------
#> Purpose: Fix arena vertical build barriers
#>--------------------------------------------------------------------------------------------------

# Run by these entities:
# @e[tag=ExplosionMarker]
# @e[type=item,tag=!HandledProtection,nbt={Item: {id: "minecraft:nether_star", tag: {CustomModelData: 1}}}]

# Summon a marker which will expire after one tick
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["tempExplosion","marker"],Duration:1}
# Set the markers to map height
data modify entity @e[tag=tempExplosion,limit=1,sort=nearest] Pos[1] set from entity @e[tag=marker,tag=arenaHeight,type=minecraft:area_effect_cloud,limit=1] Pos[1]
# We found a hole. Let's fix it.
execute as @e[tag=tempExplosion,limit=1,sort=nearest] at @s run fill ~ ~ ~ ~ ~ ~ minecraft:moving_piston replace #calamity:protection_replaceable
