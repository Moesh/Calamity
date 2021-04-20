# Called from: calamity:build_protection/search/section_small, calamity:build_protection/search/section_small_all

# We only really need to fix the wall at around the same y layer as the explosion happened
# We will just do a relative fill from a y layer a little under the explosion up to a y layer a little higher
# Now there is a problem though. /fill doesn't work if you try to fill blocks outside the world.
# This means that if we try and fill down at layer 0 it will fail since we can't fill from -8 up to +8 as -8 is outside the world.
# We also don't want to fill moving_piston blocks above the arena height since the player can't get there anyways.

# y=0 to y=9
execute if score #tempYLocation gameVariable matches ..7 run fill ~ 0 ~ ~ ~8 ~ minecraft:red_sandstone replace #calamity:protection_replaceable
# y=9 to y=arenaHeight-8
execute if score #tempHeight gameVariable >= 8 CONST if score #tempYLocation gameVariable matches 8.. run fill ~ ~-8 ~ ~ ~8 ~ minecraft:red_sandstone replace #calamity:protection_replaceable
# y=arenaHeight-8 to y=arenaHeight
execute if score #tempHeight gameVariable < 8 CONST run function calamity:build_protection/fix_wall_high