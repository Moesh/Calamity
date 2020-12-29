# Called from: moesh:load/reset_entities

#---------------------------------------------------------------------------------------------------
# Purpose: Kill entities and items by teleporting them down to void and then killing them.
#---------------------------------------------------------------------------------------------------

# We're going to teleport entities down to void, let's make them not glow first.
# I guess players are essential, don't kill em.
execute as @e[type=!player] run data modify entity @s Glowing set value 0
execute as @e[type=!player] run tp @s ~ -50 ~
execute as @e[type=!player] run kill @s

# Let's alert the devs.
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"All non-player entities cleared","color":"light_purple"}]}