# Called from: calamity:build_protection/handle_explosion

# Run by:
# @e[tag=ExplosionMarker]
# @e[type=item,tag=!HandledProtection,nbt={Item: {id: "minecraft:nether_star", tag: {CustomModelData: 1}}}]

# An explosion happened within 8 vertical blocks of the map height. Fix the roof.

summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["tempExplosion","marker"],Duration:2}
data modify entity @e[tag=tempExplosion,limit=1,sort=nearest] Pos[1] set from entity @e[tag=marker,tag=mapHeight,type=area_effect_cloud,limit=1] Pos[1]
execute as @e[tag=tempExplosion,limit=1,sort=nearest] at @s run fill ~8 ~ ~8 ~-8 ~ ~-8 minecraft:moving_piston replace #calamity:protection_replaceable