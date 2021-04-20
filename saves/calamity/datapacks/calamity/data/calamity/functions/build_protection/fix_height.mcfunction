# Called from: calamity:build_protection/search/small_section_all

# Run by:
# @e[tag=ExplosionMarker]
# @e[type=item,tag=!HandledProtection,nbt={Item: {id: "minecraft:nether_star", tag: {CustomModelData: 1}}}]

# this marker will self expire
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["tempExplosion","marker"],Duration:1}
# set the markers to map height
data modify entity @e[tag=tempExplosion,limit=1,sort=nearest] Pos[1] set from entity @e[tag=marker,tag=arenaHeight,type=area_effect_cloud,limit=1] Pos[1]
# fix it
execute as @e[tag=tempExplosion,limit=1,sort=nearest] at @s run fill ~ ~ ~ ~ ~ ~ minecraft:moving_piston replace #calamity:protection_replaceable
