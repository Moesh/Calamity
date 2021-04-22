# Called from: calamity:load/reset_entities

#>--------------------------------------------------------------------------------------------------
#> Purpose: Kill entities and items by teleporting them down to void and then killing them.
#>--------------------------------------------------------------------------------------------------

# We're going to teleport entities down to void, let's make them not glow first.
# I guess players are essential, don't kill em.
execute as @e[type=!player] run data modify entity @s Glowing set value 0
execute as @e[type=!player] run teleport @s ~ -50 ~
execute as @e[type=!player] run kill @s

# Some devs will tell you you only need to run a kill command and be done with it. Sometimes
#   entities drop things. Those items are left over on the ground, so we teleport all entities to
#   just above the void before killing them. This makes the clean-up easier and more reliable.