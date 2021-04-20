# Called from: calamity:build_protection/fix_wall

# this marker will self expire
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["tempExplosion","marker"],Duration:1}
# set the markers to map height
data modify entity @e[tag=tempExplosion,limit=1,sort=nearest] Pos[1] set from entity @e[tag=marker,tag=arenaHeight,type=area_effect_cloud,limit=1] Pos[1]
# fix it
execute as @e[tag=tempExplosion,limit=1,sort=nearest] at @s run fill ~ ~ ~ ~ ~-8 ~ minecraft:moving_piston replace #calamity:protection_replaceable